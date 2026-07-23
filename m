Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020DDC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 04:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kyZ+8vlhDWQseod3wYamjQd64WvAC5QZs0pWsqKRcc=; b=G9K2wAWyT8jIomL7SX5oD8j8Py
	rZMyFCqcqvEwZsylWfj4Ml2DWj++Lg0pzQi01jLz8rM1SrNWsq64LvOX6doyTeglfAiG5MjHCERkv
	tFFtwIbgZP4SPy1z/aDpNVps9Qa7aVrYJtEytrClgsFn6pNEDv2mBPTVNyGhObKi/+gQwXZpPxtnb
	CUOTAvwjZQfVJ+lreCrBBDcOfLsappdn+Jm8eEUWRcgTESUit7DriJ+/RBtUh4DWBpgQzDuS8pJjt
	Dg+OlDbxNmCAODE2+Ndi2uJVt4ofOesO08GiICmDEB08nQxCnQ9tFjqE+4nmgV7UE8wEa2bNTvyGa
	HsugHe6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkov-0000000DNjk-09MW;
	Thu, 23 Jul 2026 04:14:05 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmkos-0000000DNiz-3oX5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 04:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784780040;
	bh=4kyZ+8vlhDWQseod3wYamjQd64WvAC5QZs0pWsqKRcc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Xalw6wZgnkGoQBzHgP6CqdIEpb+aiwlBxYf42u9tZI5FG5JAd78Y4AEGIaDNNQf9u
	 bGKHWGrQXyrJXzXedEeKpcXQVGe/cOoHD5ax5tsjgUjQtU8IlIRBxMPwqeFmi7y74g
	 BO7PewybUvcNES/c7ahMAGrF4Fbv7L/GzQNlB57wgHDmCpzUuGeY2mmGCycAlpRVzy
	 D1aZwy62RSdi1YF5jrRGbbRxujpw4+eTmH941bqo3vat2Cl8A/NrWT7dmH6BkgXcxP
	 3qBfvgywzRAuhWp0DI3lXBn1oxw0NFIudB89Q1GWtL36ntf7R6/gECmmZfPhXqru/c
	 To1SuFTJbI47w==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 828F966DF3;
	Thu, 23 Jul 2026 12:14:00 +0800 (AWST)
Message-ID: <4622688c45db99274e6862c15fe665268c9efb10.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 1/2] ipmi: kcs_bmc_aspeed: g6: Add KCS Channel 4 over
 PCIe
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: =?ISO-8859-1?Q?Gr=E9goire?= Layet <gregoire.layet@9elements.com>, 
	joel@jms.id.au, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	corey@minyard.net, devicetree@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net, linux-aspeed@lists.ozlabs.org,
 	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Thu, 23 Jul 2026 13:44:00 +0930
In-Reply-To: <a283420c1fb6a99df5331e078c7f15b3c97822c6.1784732161.git.gregoire.layet@9elements.com>
References: <cover.1784732161.git.gregoire.layet@9elements.com>
	 <a283420c1fb6a99df5331e078c7f15b3c97822c6.1784732161.git.gregoire.layet@9elements.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_211403_139350_6A1795D2 
X-CRM114-Status: UNSURE (   9.65  )
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

On Wed, 2026-07-22 at 15:11 +0000, Gr=C3=A9goire Layet wrote:
> Created a 5th KCS channel to match against the KCS 4 over PCIe addresses.
>=20
> The ASPEED AST2600 has a PCIe to LPC controller. It includes a KCS
> interface on channel 4. This is a fully KCS-compatible interface
> that is exposed over PCIe.
>=20
> The 5th channel created is only valid on the AST2600.
> This cannot be used for AST2400 and AST2500 chips, as they don't have LPC
> over PCIE.
>=20
> Signed-off-by: Gr=C3=A9goire Layet <gregoire.layet@9elements.com>
>=20

...

> @@ -373,6 +395,9 @@ static void aspeed_kcs_enable_channel(struct kcs_bmc_=
device *kcs_bmc, bool enabl
> =C2=A0	case 4:
> =C2=A0		regmap_update_bits(priv->map, LPC_HICRB, LPC_HICRB_LPC4E, enable =
* LPC_HICRB_LPC4E);
> =C2=A0		return;
> +	case 5:
> +		regmap_update_bits(priv->map, PCIE_LPC_HICRB, LPC_HICRB_LPC4E, enable =
* LPC_HICRB_LPC4E);

This one exceeds 100 chars. checkpatch can help catch these types of
issues.

Otherwise this seems okay.

Andrew

