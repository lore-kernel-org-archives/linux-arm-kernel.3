Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1B8EA4E24
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IKc6dncBvpCzLVVy5eLwzF3fQEzsiCYpuqqJpKtYgdY=; b=agqE0UpBTgbo0VSlvs1leo0IBD
	Qi8hPxCAUU2UtmuTIDsZAA5ddzILpSPrVjfA+xIgrJ0gVY4p2570gemcIbONOM+7zGatKMsP+lyBR
	jYbVrKfR/X/wpKfz6OFp9FloLhiMhWhgDCJDqITHYOSXTmHTWI99fykYHNs+6wNwhYS0lscKYomy5
	5GJ0miG4CInQGOdlOBZIGqxYlDLq3AfEhW3ekNFci+De/Vj8n/2ai+gIPFrNtsLLLpCSx84e37j73
	mvU08GEYokr7Q8C1MrfwPmTctKVKZQqpKbCkj7AYHTboKrnwvLkCWyYkf+iXm7B+GA0/jh3rApvVH
	MDQvOKfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5Sx-0000000DOZr-0VJx;
	Mon, 02 Mar 2026 15:45:51 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5Su-0000000DOZ0-2JV0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:45:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 124354E41046;
	Mon,  2 Mar 2026 15:45:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DBF9A5FE89;
	Mon,  2 Mar 2026 15:45:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0DF510369450;
	Mon,  2 Mar 2026 16:45:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772466346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IKc6dncBvpCzLVVy5eLwzF3fQEzsiCYpuqqJpKtYgdY=;
	b=NhhGyxUxSZEVr92VqQydLdmxl/4vDOLsc7bp++8GflFzymW/Se7h1Xwvl0caop5Jj6pg0X
	2x1s25MrPAIzIDEOQk8QphW/KjKUA6vGbV2dpZTrGY85lKBPa4SkEvwIS/vABBK/iRIWi8
	9bLHO17DvRvkPf7mXtXl9eRwcI6kqqxysr+pPz+THT35zmbkABjv2VkBtTy+9R4hD+TWSB
	VM7e/cETdP1jwgFRqTwogRlrTfHzHMTn2SsTZRDTaCQsRb8LsmN9nB/mZdZxPl8f+/i+7W
	cJ/QX1vFfq/XH/cuRysJTjA/C82/Tv9CqA6ga54g1ecA4/YAPjZnmjIWB3gZ+w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: drop redundant status
 property
In-Reply-To: <20260220-armada-37xx-status-fix-v1-1-716180561d86@gmail.com>
References: <20260220-armada-37xx-status-fix-v1-1-716180561d86@gmail.com>
Date: Mon, 02 Mar 2026 16:45:44 +0100
Message-ID: <87h5qyfd5j.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_074548_718786_AFF8BF7E 
X-CRM114-Status: GOOD (  13.36  )
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

Gabor Juhos <j4g8y7@gmail.com> writes:

> Remove the 'status'  property from the 'armada-3700-rwtm' node. Device
> nodes are enabled by default, so specifying the status as "okay" is
> superfluous.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/bo=
ot/dts/marvell/armada-37xx.dtsi
> index 87f9367aec1227c2c6de52f358d51bcff758c147..6237334833a247855bedb5c5d=
6c7618f5819a967 100644
> --- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
> @@ -534,7 +534,6 @@ firmware {
>  		armada-3700-rwtm {
>  			compatible =3D "marvell,armada-3700-rwtm-firmware";
>  			mboxes =3D <&rwtm 0>;
> -			status =3D "okay";
>  		};
>  	};
>  };
>
> ---
> base-commit: fcaf733ca526b69595ed1d227e2cc59ddd24eff7
> change-id: 20260219-armada-37xx-status-fix-7478c1d3b1bf
>
> Best regards,
> --=20
> Gabor Juhos <j4g8y7@gmail.com>
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

