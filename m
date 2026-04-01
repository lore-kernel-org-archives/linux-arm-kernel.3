Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8208D35165
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IliRtp23+Sa5Co6XxnaezGD+F5mzHo4cTb7JGl7ZDHI=; b=FaWx4ma4JDYBVjQOzVBB5fufxB
	mINXMttbH/fGzwJEnuxqZeAQT/R/rpGfcTCeZjdxanxUnCfQeAr4+CqUuV36/bnDTUbuek50iFHk0
	erhyEYMa+eZWwEly+HDVGhJsFXQBTgo2sJawoh460HOqOe5wtZMjaBEpsStl1c79zPXzh0XdkIijy
	qFtj+vqaK72L1h5NhxBXPgjUxHXHoC9evN30tZ7UT1xDenSvm/+RPrK2E2WBmjd26YRkw6KjM0GFy
	+EgdSfGmbi/XYhYN3yllSXJy3gQswlrC6jkAPpEEproOoU4a5TPS5gj7fSVP/VEP5CJovjqkuP3Zx
	B3ZiQtFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ycy-0000000Fkg2-2hPW;
	Wed, 01 Apr 2026 16:41:12 +0000
Received: from mail-qt1-x861.google.com ([2607:f8b0:4864:20::861])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7ycw-0000000FkfL-3Fmc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 16:41:12 +0000
Received: by mail-qt1-x861.google.com with SMTP id d75a77b69052e-50babbce85fso63046661cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 09:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775061669; x=1775666469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IliRtp23+Sa5Co6XxnaezGD+F5mzHo4cTb7JGl7ZDHI=;
        b=b67C79cavlezd3CJlVAirsHyWLsBGhhBI+NOqgfC1pfgxvujDH2212zoO3Cmm1UK58
         4YdPQX3Jo/rJ4cleU8QRtYDRSaZuYW1Kg81xR6YI60sqsL36wb9yGKRdKaThEq0mYgFg
         fABp+nHSJpGhjnhVgIPV9uInM01GaU4W9dCEKM9K8E09kQPe1WVUk8Ad1KZ7daaxkcF2
         kVvjc5SX7NSUW+UI+UVd8tdykZWnkJU2YB3j6pBHXni5h11uNNr8GyzCdChCuEkb8Snn
         REx+Mwnpp2yQHw7hK7ETTb2TT1XFr6L2TUHjG8a9jqyeGJ95Y3Y5OVHCjoHAc0hPohVT
         3S7A==
X-Forwarded-Encrypted: i=1; AJvYcCWunFqyHURrhWMRduCs7IVw7BgDh0ha3rGiRzkagz726ohDDnA/CANRZYKMfKt8FlfvcEh9BtpYJ2ktYeh+qAaU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7k/as7xMhv1Ud0ojCK2/kWhRVX5cfhMhaDXw5scNQMXcPMiwp
	enBh+L3MdhjNGsqGuyzY8JKaEyrxyFt4aTA/wtVKIKj6304M/aMt0vQnJNVo+vcYFUGPxt9yM7S
	0sqWv5CxEbxwGu7RMiposB8K7manfL0bMYMwgD7OuwHYwxnvYpQd1A4ChP2LPt6HPFSv6MoZnd9
	ijRqmjSFtQvJWUtRdXu4xEXOEQAJAmVeNQrg6PJZd869c14ODoHZTrIHJfqHVwCW7ib/WV4Sz8j
	0SkTBAcilvxX0JoTAzjrnvr2/birTVemJw=
X-Gm-Gg: ATEYQzwp5pJ0zx58BJXz9YUyu89z4KJowuw0c8P/Epui9l1UzAeidSRKagJS7W+Y0gT
	OTgjJRlLcjhyvhDi2d4b9bP7IfT2YTzAi2f5tCgzCzwcssal1tVmVIbdsyP7Kup2n14KF+Kj79g
	ESC9GvaBgV4mG9yoh04FgZkU23lDf7r0qCHg/7yvcxQP90ZDvUwJidizz7cSjq+1ckPB+vCOxL5
	Goji6RUrzE854PeC6Vg4I+Ksa9giE3hY+HJn3NPYP+b5zIQfzq9SZu0pJlYjlAx4dwEs3SH2lLj
	MiJXrw5A907JWtA+rwLEM0VyQGzvaOu1cPqqOX1Uo9z0U0CODhtI9S18EAQkxkqv6hpQ1Qgqk1W
	h6Tz3WK+3wJS05Z6ejXT3Z3C67sfk0T9dTzIDLnXGL2SodA98Ypp41T32MBHuwp6MP8AUD7f9Pu
	bvqvtuJaYbpKGTZDfX69Tob078AMXteE/WM1LHVQ7jIYzWJyw5NvXlrSTRtGOc/ZqT
X-Received: by 2002:a05:622a:5a0f:b0:501:17a9:5ff5 with SMTP id d75a77b69052e-50d3bbb20a1mr63799821cf.21.1775061668625;
        Wed, 01 Apr 2026 09:41:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-50d4b16b206sm101131cf.5.2026.04.01.09.41.08
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Apr 2026 09:41:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c0ba59a830so7067eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1775061666; x=1775666466; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IliRtp23+Sa5Co6XxnaezGD+F5mzHo4cTb7JGl7ZDHI=;
        b=KtLKxyILSnPVo3wXhM8MJ0IL8pHP/wzPYdfuvhxCel9cz0E5DMtUbuRn+IawoognTx
         5QJu4KImroJ4zqOU19cqPtSi0egoipHeiOGiJpwHN+JrV46RYqUCMehI643czSA8nu+N
         EREAIQdq1GJUe59PRHZ5K/BFlBMSVTLx7nrKk=
X-Forwarded-Encrypted: i=1; AJvYcCXb2GZlx6NUSVdKNsEtj34u4omxSutAl0xI+CSOA4cfwIfRDOxMDJ4+qKS5oA4qiNMxx/G9PZzu2BnfLaLwF6Sg@lists.infradead.org
X-Received: by 2002:a05:7300:2213:b0:2c4:4fcb:4f60 with SMTP id 5a478bee46e88-2c93116ed77mr2352048eec.14.1775061666475;
        Wed, 01 Apr 2026 09:41:06 -0700 (PDT)
X-Received: by 2002:a05:7300:2213:b0:2c4:4fcb:4f60 with SMTP id 5a478bee46e88-2c93116ed77mr2352017eec.14.1775061665705;
        Wed, 01 Apr 2026 09:41:05 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca792f3f54sm185911eec.7.2026.04.01.09.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 09:41:05 -0700 (PDT)
Message-ID: <e060307f-5c85-468f-8f5d-6101dc0a2015@broadcom.com>
Date: Wed, 1 Apr 2026 09:41:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.1
To: Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, Rob Herring <robh@kernel.org>,
 Gregor Herburger <gregor.herburger@linutronix.de>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@kernel.org>, bcm-kernel-feedback-list@broadcom.com
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
 <20260323190239.1890505-2-florian.fainelli@broadcom.com>
 <20260401-rapid-lyrebird-of-emphasis-da7b13@quoll>
 <2e47f487-da04-411d-bf78-4c76ac793a91@kernel.org>
 <df52b2ae-4b8b-487a-bb6b-07bf021500b5@app.fastmail.com>
 <3f7879d0-9e5d-4c00-a5dc-4871a049afd0@kernel.org>
 <83a52edc-1d46-4eaf-996e-924ed3a00c83@app.fastmail.com>
 <8d8925ad-22eb-4b9b-b6eb-6ae7dc3b2073@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <8d8925ad-22eb-4b9b-b6eb-6ae7dc3b2073@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_094110_876071_25A9C7F9 
X-CRM114-Status: GOOD (  17.89  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 4/1/26 09:38, Krzysztof Kozlowski wrote:
> On 01/04/2026 18:33, Arnd Bergmann wrote:
>> On Wed, Apr 1, 2026, at 16:47, Krzysztof Kozlowski wrote:
>>> On 01/04/2026 16:37, Arnd Bergmann wrote:
>>>> $ gpg --list-sigs 9BE46ADFE60625D891F72B8587D0969C44070704
>>>> pub   dsa1024/61579915B563760E 2008-09-16 [SCA] [expired: 2024-11-06]
>>>
>>> dsa1024 might be another answer... DSA1024 was deprecated by NIST in
>>> 2013, so maybe gnugp even drops it just like keys with too weak signatures?
>>>
>>> But another problem is that I do not see it in the `git log` of keyring
>>> at all which suggests it wasn't ever submitted.
>>
>> Indeed, that also explains why the Broadcom tree is hosted on github
>> rather than git.kernel.org. While using the kernel.org hosting
>> is by no means a requirement, github does occasionally cause problems,
> 
> Kind of, but quoting Linus' policy - either kernel.org or properly
> signed pulls by a key in the keyring.
> 
> Of course new SoCs/maintainers are exempted of that rule, but this does
> not apply here.
> 
>> and I do get a bit annoyed when it takes ages to pull from that.
>>
>> Florian, I don't know if there is a Broadcom specific policy that
>> requires you to use the corporate github account, but if you
>> are setting up a new key already, it may be a good time to
>> also move the hosting.

OK, I will get going with moving the hosting to kernel.org. What about 
this specific pull request, will it go through or is relocating the 
hosting mandatory for it to be accepted?
-- 
Florian

