Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6401C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwmGunZ4TWdaLeHjvaUPRZg5QM3iUl8u5EQVShEynPU=; b=folTGLNkNOEreAfurBPEV+5hFY
	FicOZrIss8U5JItRrKAxFAfuBMEafCfsGg57j6t7fAwc5JPYgV3m5DcsUpLflB2xTJsBYt74mKGDm
	HBIjTZ1zOJg9PR3Af/3Xf7Tq0ZLvOvqVI9gLmCJUv3Z3/K8+cv91SOGsMjM96zBrzOmfGNzBV3HJz
	IpGQIW/XLKE0+OkEzST7LIUEuD8h3C/kDc84bgrZlzQOp9MkJTWrHU3uNJe1Um+eDjuD6ITpaWnRa
	WXfW6igxusx5/S7VlHYvJMQ475oSFIkGmYqr9JbGhK+EKETp0laf3XQjNEbmy1uT/mlVeP3wuc6JT
	TEOZLIUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrJU-00000007SQO-3w74;
	Mon, 20 Jul 2026 16:57:57 +0000
Received: from mail-qv1-xf63.google.com ([2607:f8b0:4864:20::f63])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrJS-00000007SPf-06dB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:57:55 +0000
Received: by mail-qv1-xf63.google.com with SMTP id 6a1803df08f44-8ee88fce572so80490296d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784566671; x=1785171471;
        h=content-type:in-reply-to:autocrypt:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwmGunZ4TWdaLeHjvaUPRZg5QM3iUl8u5EQVShEynPU=;
        b=OQ/HHujklNcFPjs4pDA3DZPrsWfr7OhnhMVPL16DbZZDUCjJB5cQDoyMDUx/tWBuoF
         +2Hgh3auqfSOjbvpneQGQvMeTBU77TIcme1rt/If6lOpmFLYgA88mI2wbwUvISgVDpH9
         apH2V4S1lm06aee8+Kyw9XfzX90lNZlj/sRF4Ds7ULshqKAjHeO78XOUaFeJv+flergy
         riz716DVcwUTwPBcFRu0Swyh3fSR4wj95YLSon2bs67VKW4Q5dmSyJTDtOBF3hQeurue
         8EmeDSrcJILt31ZjdsY8BoHpykmFcmaWjFEKhE387QIg1qhSZpNxtuJiQ4ho72HNYm9X
         6fpw==
X-Forwarded-Encrypted: i=1; AHgh+RpY4aGois1FOdS/o3F6HUn58iwP4XE6NwlYLViKpmaC7XMtxde2WahR3PtQjIngbho51w3Vvwf8MZpFV60ExEFO@lists.infradead.org
X-Gm-Message-State: AOJu0YzTW5fIGbsh9Cdwq5J9pdc6sQ2w/xi3nIsS2VMcAN0IueLK1hZ+
	IKON8BRKjsgvfx/WW6QVVjRf3H4C/H7dr2M1srb95zdPugErr5tFNKTYOzgbvbMcoFaHoSnhEk4
	T3szLgJ7d4tQeEVaXhuzTuJE47bTeAMv3y4f9UeQ3F4c/f6YinsMoUy3lFSq5gL7dqIJi2RzrI6
	/KhkT8OO4gC/9+jJ2/yefU3A0vF7BkJHNSOPrqmDeM0ISeeCCwc+omhDL1zIR4ECuqY85yRrOTl
	eq1SkM4J7g6tNbRNNa/CjfVEArW/M2kf0g=
X-Gm-Gg: AR+sD11qZ2Jl0M/1yX/aGjVW0O9yWHXAV4kgvMKQQopJkjbA8usLrgI6cOuWR5yXb9t
	SWNTtp2QLwwtiPN09GW/gPLNDzFKr/E5hpj0/F9wQCmbU5gJarDf8q1VMGFDjuNEYblfwqrJPRP
	ah1hwRZeN8ZTsI6FCVkBFJfJ8h01Ox5s9GNDeGxfPIllG0TO2ntVF5WMNszFDVdNnP/9o1/c0+k
	Mube89sL0aYZcqn6KSoNyZAZyVeCL7K39xEdK11XKTS78GpBK7boycxT5oT/ACUepYjqkWIYTVM
	o5909HZaINXw+IP0fBIrTjOrfHlo4lFODQ+aQPEh5MMXHtbQY6HU1yyMrMVM4vrOYIG2xWZLjfA
	axs+TwJqWe5bb12dG7o2JP7iP4U1Royl43PpJA0LrGjez6wmbk7628SYrcOah0B8124dKH1zy1U
	Y234EpXXBqjZUc1fJk3SowgDMfnriYaeJkR+B3HHlFLgI=
X-Received: by 2002:a05:6214:416:b0:8ef:33aa:94d7 with SMTP id 6a1803df08f44-907783a065fmr162838006d6.40.1784566671334;
        Mon, 20 Jul 2026 09:57:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-9077869b5edsm5823146d6.19.2026.07.20.09.57.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2026 09:57:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5b2a35b9306so194300e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784566669; x=1785171469; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwmGunZ4TWdaLeHjvaUPRZg5QM3iUl8u5EQVShEynPU=;
        b=VibGXbeggZ2zXITNJvn0oKRWNdTUvzFw63u+wHDdrGqykLlpzFelc0nzK3H2a07jYE
         DPvlRJgj75TBclL9z5UZmPl+wrbvQ5sXcyHvezVL44ep0XufbdRhF0rAB/184389Mykh
         hgcIT4rIxdbSw3M9rXDQq5ndkDNXmA2gJOuZ8=
X-Forwarded-Encrypted: i=1; AHgh+Ro2hS5q2AnoesSZIqz5Z2P5Q5idypJhLCC6uKIhM5nwOk2kIyru3CEBnkpQEMulfmjIX7QsEDZtThNEhAO2dNvw@lists.infradead.org
X-Received: by 2002:a05:6512:b93:b0:5aa:8822:c945 with SMTP id 2adb3069b0e04-5b28f9b72bdmr3591669e87.47.1784566668881;
        Mon, 20 Jul 2026 09:57:48 -0700 (PDT)
X-Received: by 2002:a05:6512:b93:b0:5aa:8822:c945 with SMTP id 2adb3069b0e04-5b28f9b72bdmr3591622e87.47.1784566668133;
        Mon, 20 Jul 2026 09:57:48 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e1887esm2450178e87.59.2026.07.20.09.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 09:57:39 -0700 (PDT)
Message-ID: <b8062978-128c-4129-a803-1d02910122c8@broadcom.com>
Date: Mon, 20 Jul 2026 09:57:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] net: bcmgenet: use platform_device_set_fwnode()
To: Andrew Lunn <andrew@lunn.ch>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, brgl@kernel.org,
 driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 iommu@lists.linux.dev, netdev@vger.kernel.org, linux-pm@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-4-2dee93f42c54@oss.qualcomm.com>
 <ae9da5dd-3528-4270-ada0-d17ed14478e0@lunn.ch>
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
In-Reply-To: <ae9da5dd-3528-4270-ada0-d17ed14478e0@lunn.ch>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000069b3ab06570dce72"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_095754_138413_95C37613 
X-CRM114-Status: GOOD (  14.24  )
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

--00000000000069b3ab06570dce72
Content-Language: en-US, fr-FR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 07:38, Andrew Lunn wrote:
> On Mon, Jul 20, 2026 at 11:24:51AM +0200, Bartosz Golaszewski wrote:
>> Prefer the higher-level platform_device_set_fwnode() over the
>> OF-specific platform_device_set_of_node() for dynamically allocated
>> platform devices.
> 
> Why?
> 
> This driver is OF only. It does not support ACPI, and probably never
> will. In general, networking and ACPI don't go together, ACPI is not
> sufficiently advanced.
> 
> What is you use case here?

The driver has been, or was used on ACPI-based platforms:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=99c6b06a37d4cab118c45448fef9d28df62d35d8
-- 
Florian

--00000000000069b3ab06570dce72
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGnzCCBIeg
AwIBAgIMaT9V748TBL0gqLOFMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYxOTA4NDMwM1oXDTI3MDYyMDA4NDMwM1owgeMxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzERMA8GA1UEBBMIRmFpbmVsbGkxEDAOBgNVBCoTB0Zsb3JpYW4xFjAUBgNVBAoTDUJST0FE
Q09NIElOQy4xJjAkBgNVBAMMHWZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tMSwwKgYJKoZI
hvcNAQkBFh1mbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQAD
ggEPADCCAQoCggEBAK9u0aBdl51z/nEmpFSqdvC3Bu87AnBaOq1NGLM4vKTwCRuh1hSPhQOJkIB0
X3lGlHAEUufNmKYb1aeLHW2kToCe+9mr2cBXqHP0aWl/Oy/ZjQabOsXzOzE0SfGLnLfGJMLV7yFB
pwKwqxC8t5MBK+6zhQZGcnnuz9wF1tWGdczOeCmQCTO9+MlB1fNac8pKSB8bUhOSC4fr0ev7BfPA
KmfMr9BBremQmDCaHeTwYy6wZLdj4dZzGMfF6PZOLiV5DU61ehA+spBd00RbowgJfmI525dEWihB
DaLZim3cCy0sCU9GfGm2sHUX+3B0S6twomZzsrTE02PfoUuxXAqf0gMCAwEAAaOCAeEwggHdMA4G
A1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcw
AoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIz
LmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1l
Y2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0
MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNV
HR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
My5jcmwwKAYDVR0RBCEwH4EdZmxvcmlhbi5mYWluZWxsaUBicm9hZGNvbS5jb20wEwYDVR0lBAww
CgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFCuk
Rbf0cgc52/dpv3u8tk5QBzfLMA0GCSqGSIb3DQEBCwUAA4ICAQCEf8H6iR/fp2Yv2FycUR0XNfkZ
5C5jGago+UGEiNDE1ZEz27RO9dIuFrh6TPwC7Z9zkRxSSEPoXEF9UmaNZpUK9hIOLja4nh2xD83z
udss8gNXHS7AePBy6asDTxJVl+S+Ls7j1mr9udBw4WCD6pSa8PfyTKjG+zhD6BWxBuajysSfyXNJ
lQkOmI4EW0SH3VOIIwZRb1QjxFhPyJI6rqp4osvjzNY3YFtK/F1ylmGI5m0RkwtqgJ/0Lx115i9U
uIo/v/g1BPD0rQqHpVtLvfH4s75U0vw8Cd+Wg7QQUk21PxweqcwnuFakkHi6xarxwnlijKgv9vZn
5p3Gf6TWVrCD7mXWDbl4D+KndfIa6E7hc4xPUA+idcQ02s1s6lfZ36s9f/5ZY9L+BwR12LFvzKcf
JhVO78ugQDvSIrbq4lgDk4HILUi7se+UWdSWg/GvaglFs28PE9DoxG3MOX4wrbXPqpD3lrnZDFMM
uPID5U7ukJqoVbHLZU3u11CcI5k9ko1s9A1Q11sOaUcJHvma/vYz0K0mub0Li4MBym/O5K+kJ98p
sguXKkldCDDtyTm5mFBVXOqbXFDn/oBPRIcHEgjXf8xZVEU6Sh90+k87Vm91WZMWona3POJKJVhe
9sd9RXscJiiFPaZ7E2d3IHNuRetYSfVr9qZl1mOcJIB1i0f1djGCAlcwggJTAgEBMGIwUjELMAkG
A1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24g
R0NDIFI2IFNNSU1FIENBIDIwMjMCDGk/Ve+PEwS9IKizhTANBglghkgBZQMEAgEFAKCBxzAvBgkq
hkiG9w0BCQQxIgQgtguLygfxrhNVB5QxIrqOmU3TKZb0RS+lv6/SRrX5y/UwGAYJKoZIhvcNAQkD
MQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYwNzIwMTY1NzQ5WjBcBgkqhkiG9w0BCQ8x
TzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAeq3nYXlza/7W39PhvFKy
GEWmWyI2kGnHey4BbWIJ+58V56tjtS4AGMtUU5albTckgEWz0OLwdmggt5FneaTbrrNdq+cPOgwf
fBH+kg9gn+L6Svf2oE5zIgqI2eRIm7oUQPqBrFgA/gk+uaRK/jjB8H4LkAiRIyNLD7m28w8cj2UC
KdCQ/hmg2XWlF6YVw9PO/TFgO51PK4ea/EWtWoq8qEZpxC2tkj1Afx0rIRe20Oa0GQwa8M87hidX
orKliNijwhW+xSIHDfyQciFwSgilj+pq6AkpfG4syt2y4zeR12JTJUGQ3CrjnCBgyia+81uDFViX
8rECvV643IfMgrqimQ==
--00000000000069b3ab06570dce72--

