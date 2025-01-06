Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6097FE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8skViHkHUdTzDUwE6oxnQAwKjn+7wyUOhiP2qZ6VJs=; b=xglMAyeB21ALPo46oD4tj1/2qx
	Ddr9nsHNaCsFOkd2I5I39In7wSXcCF/YT/9yzDD8Fn7/u19P06LhxmrZEtCiJrIOqFUUV2BeT3KFp
	4zd3bZW/TjubqLsCymSIQgh7D9UjFgLObWfQh3bJvBxqQ6HTkRgES38pOAppXI1bzqLw6u/Qrke2H
	18i1GYf0PfusbuBR8m/CPvnhwMrBd5pGklsQZ8Nm81Dt3v727J39uU6DrYTh3gS1S8Vg79WpugxVl
	GI6SWQNZWCeDRSYDPGYArlSVXIRHsdPBLfK4vq+XngzkGexagTgUWB4QplT/jO1v+PK5VtdjDGloY
	E+wanxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUp3e-00000001mCC-0lp2;
	Mon, 06 Jan 2025 15:30:22 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUp2N-00000001lth-24Ue
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:29:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E11C9C0006;
	Mon,  6 Jan 2025 15:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736177339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r8skViHkHUdTzDUwE6oxnQAwKjn+7wyUOhiP2qZ6VJs=;
	b=ezpS4D9hDotHMMLeCvK29RNsk/GClufpghlnuVKXrCNppd94dObGHEflvQPfEDo+xQjW4L
	7N+TCKDYGZYiMF5HY9NTDjEf7xz+X62oNAltUPPSx9T03FbJjWfbpssbXs0eXQTJGi06JN
	rex37pwWVJdlnzdtfKLSlhF4DiCSG3rkPzlBvHHu84h9Rn4u3agjF88BLPuO1d7JMSeSfy
	j9L9mIyNBU6pLe8gfy6i/SjrUwYMiJVOhHJ+/2i5KkYuLj1VhsAl+Q3cwVIBYov3IxH+QW
	SvlPcBC+AMeZCus+vTnKmawxpOnvV4hIHCkAZIBQWSD7TYWJXzRoKSZkd9g2uQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Frank Wunderlich <frank-w@public-files.de>, frank-w@public-files.de,
 robh@kernel.org, linux@fw-web.de
Cc: dlemoal@kernel.org, cassel@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew@lunn.ch, sebastian.hesselbarth@gmail.com,
 linux@armlinux.org.uk, hdegoede@redhat.com, axboe@kernel.dk,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: Aw: Aw: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf
 conditional failed
In-Reply-To: <trinity-a84b41b3-79c5-49b5-9786-eb89f85578cc-1735843472332@trinity-msg-rest-gmx-gmx-live-548599f845-gxsb9>
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-2-linux@fw-web.de>
 <20241111203611.GB1887580-robh@kernel.org>
 <trinity-796b046d-1857-413e-bb82-78e700d6b5ac-1733138371404@msvc-mesg-gmx005>
 <trinity-a84b41b3-79c5-49b5-9786-eb89f85578cc-1735843472332@trinity-msg-rest-gmx-gmx-live-548599f845-gxsb9>
Date: Mon, 06 Jan 2025 16:28:57 +0100
Message-ID: <87wmf8x8p2.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_072903_663679_96EADE53 
X-CRM114-Status: UNSURE (   9.21  )
X-CRM114-Notice: Please train this message.
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

Hello Frank,

> is there any new state here? got no answer for my last 2 Messages

Actually I waited for a new version following the review and I didn't
saw it. Maybe I missed it.

Gr=C3=A9gory

>
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/2024110909462=
3.37518-2-linux@fw-web.de/
>
> sorry for the html-entities...they came from my gmx webmailer, it is repo=
rted multiple times, but i cannot do more here :(
>
> regards Frank
>
>
>> Gesendet: Montag, 2. Dezember 2024 um 12:19
>> Betreff: Aw: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf condition=
al failed
>>
>> Hi,
>>
>> just a gentle ping to have it finally merged
>>
>> regards Frank

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

