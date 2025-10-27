Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005F5CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zMJJQX2lTX+b5vO4YJw2/2C1AupvnOMeNg1EO9Qqa0=; b=LvpiYjrjyE0Ja/D6pv0Fb7BUFd
	Kgfx75KchHY5zbwN2O49FqI+wVXrs/epjZFkaZfP6g9VWLL7oWh82fbbWcxCNlQ2yZK3OAxqNA3/u
	Y/3mU8x8VyluKfs7vuNrj5xp/CRuBwAn2ZwL8W2WzjwV2w3mZF8qfuSNm3hHq1z86mRjjqbeGh7A3
	Oa4Rw4eV28FCz/Y938JPhb0eqTPb8j7JrtpUQovJxpvnjbkFjunoZTfgl9CvjtrdAiwuVUOkkxzuO
	mI926pwSdz8/9P6GkdL9AV5VouhBbwWZZEithwcpFbWS9Vk9ar0y6RGbadCQlveuikq9sb3QDVIeO
	dOuziEQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQJx-0000000EM6M-0g6m;
	Mon, 27 Oct 2025 16:43:49 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQJr-0000000EM2p-15gb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761583403; x=1762188203; i=wahrenst@gmx.net;
	bh=1zMJJQX2lTX+b5vO4YJw2/2C1AupvnOMeNg1EO9Qqa0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WJIVQClnKu4W+AE+L+JAXD8ql77MFGLIsH3a/wmXF+zwjjf2zwnddfGEFZRZPc44
	 O32py+YRkNRciRfGQ66+ZV+ImvzhcZ7+++VdIlGI1rAuySm5qScbRQkaj5YRgh3iu
	 Tjq3vlKxM74lOv2pJdDLrc2ghK/gEVKDDpx+/Fcj7cbj6CqKnMA2WtIr9cxHSaSmY
	 ofdWDLnmmLwihuf37QDUnlRBoOrQnBVf8+Um87oGS2zHGnDEwulXZB5e9WAaLJI7f
	 YSp6cpEydWOml74jUzEqMBBCm1yZYY9vgI0jjUghLdM8oBGOhMKXxrMizsTRiIkki
	 qX6lp6U9AIN+RG8TGw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.156] ([91.41.217.223]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAfUo-1v2OkU32Pg-00GQnr; Mon, 27
 Oct 2025 17:43:22 +0100
Message-ID: <a016e7e1-09f7-4056-a855-6cfaa8d51962@gmx.net>
Date: Mon, 27 Oct 2025 17:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: broadcom: rpi: Switch to V3D firmware clock
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Stephen Boyd
 <sboyd@kernel.org>, kernel-dev@igalia.com, kernel-list@raspberrypi.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251005113816.6721-1-wahrenst@gmx.net>
 <9ebda74e-e700-4fbe-bca5-382f92417a9c@sirena.org.uk>
 <a5e1e279-7e20-458d-a75f-787e0adbc9fe@gmx.net>
 <ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <ad07546f-0c2d-4bc2-b794-755b892c7328@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1SZXqFmg/o0N8MbuD96qmf6ow4gt4Z215l3p8Ubb27z1OoV9rnh
 /I/OT3GRDluF/yDTdAmu6/GqDfpcqVU4M59N7tS06zrjPc0rqqrXGpCGteR32VLWjyhTGh5
 E6zNS8imxYdC7Kt2+0tC3799u9fl6ZO/n0jQePqpill1ExGrKSrUCqPioJzKt4OUj1CGbPt
 za4bWQZEnNVY7zLCExmAg==
UI-OutboundReport: notjunk:1;M01:P0:Fwb67goHgpc=;DJ62RNxXrOs9iUsDLB+19PpoGSB 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_094343_583874_0B8E1768 
X-CRM114-Status: GOOD (  13.23  )
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

Hi Mark,

Am 27.10.25 um 13:07 schrieb Mark Brown:
> On Sun, Oct 26, 2025 at 01:40:19AM +0200, Stefan Wahren wrote:
>> Am 21.10.25 um 14:09 schrieb Mark Brown:
>>> I'm seeing the GPU start to fail probing on the Raspberry Pi 4 in
>>> today's pending-fixes:
>>> # # v3d fec00000.gpu: probe with driver v3d failed with error -110
>>> # not ok 1 +platform:fec00000.gpu
>>> which bisects to this commit.  I'm not sure if that's just a preexisti=
ng
>>> issue which is now being properly detected or if it's an actual issue,
>>> I'm not testing the GPU at all so I couldn't tell you if it was actual=
ly
>>> working.
>> can you confirm that this issue is fixed by this commit?
>> module: Fix device table module aliases [1]
>> [1] - https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?h=3Dnext-20251024&id=3D9025688bf6d427e553aca911308cd92e92634f51
> No.  This is happening in mainline (was originally reported against
> pending-fixes) so wasn't affected by all the module breakage, that was
> separate.
I think, i got confused because I was only able to reproduce this issue=20
with the broken linux-next. So I was going for the wrong cause :-(

Do you use arm64/defconfig as kernel config?
Is there a HDMI cable connected?

I noticed that you use an older raspberry-firmware. I will try to downgrad=
e.

Best regards

