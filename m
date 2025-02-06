Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A84C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wzd+dOcVOVn7IKH7PTteO59qiKoj7qRfKTgzHatX4Rc=; b=l8WL+6+fgFJIA81VBDiU/+5L1N
	PIYA6NnXRTN7+hCZe9BhW2pp8ol+B8HB3Cy9L1olwfR1LWx3pE4ZHMNXp5ak9jLJ20411yRaBI4TW
	az66Th6KqSgvA4PIMz+qeFE3hpvgGn/BkxXHuWwxtX0rmBjBeCq3jVNVTmaFbJinuDv8OR3AxVS41
	HbNv8CWsZzDuONFGGswnhDNqHsRxCRQxLGUhMCDLPaK6YRBLR/1ilGP6IN2ZkFPa1STlIGm5LgaGj
	QAel3Dlam05jaFGzSF+04rGCEe0bHdDx2yXVUsCwX45vVnAjkYzKBIx6pmvmutKIUAxt12EbFgBUY
	Z3LlRPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfyDw-00000005qQp-2KfA;
	Thu, 06 Feb 2025 09:31:04 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfy99-00000005pR9-2IOI;
	Thu, 06 Feb 2025 09:26:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1738833953; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i8qmlm7TQ9YdxwhBzd7v5DxSdYVKqHb9rqfhtyynEIWGfb5Px1J1YHVJAB4fGsgA4qcBIUnWS2cbIf3p09NkfgQs7MukwZiBJZwK9F+dURTBHsaNP4wDh1gA5q7rNX6HRu30qHx3uoivLKXpD16GgonbjrUByJUAYqmNh6XLrko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738833953; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wzd+dOcVOVn7IKH7PTteO59qiKoj7qRfKTgzHatX4Rc=; 
	b=DYoq1DD6SveaaStvmrn6xyWMB+NfNWq5Xb+l0hRCYffV2ILQTQ/5jgajRgUd+q67Sk4AngnuPwud+th1ZI2uFlI6+iOn2t2PPtU+djWrO8jDfdS/QEk6oCuyhX23wt5if6dFf/5ppgSo6lWitSDa9BGyeFP8hG/zlWm48TFZfSg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738833953;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Wzd+dOcVOVn7IKH7PTteO59qiKoj7qRfKTgzHatX4Rc=;
	b=XixU04o5JpLnZ8PmlweIXQbaj5w/Gx8QBL06y9vY/L0mCcqyiT7GgMARa9sNBrkE
	vmJVcGdmkL6Ngh9WW1YZfOIpL1zrixFYNxOfLpysrpS9QtkKR1GjeOMKQUthSbJ+n3L
	p0YdM9Bq9LC8BZnlWMajJ6LZlZMt75KZSrmcarLc=
Received: by mx.zohomail.com with SMTPS id 1738833949854891.3350291196675;
	Thu, 6 Feb 2025 01:25:49 -0800 (PST)
Message-ID: <6f893666c09c39159fa0c273c435cf53509f6fba.camel@collabora.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: mediatek: add mt8370-evk board
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Date: Thu, 06 Feb 2025 10:25:46 +0100
In-Reply-To: <83a354d0-e220-449e-b03a-12012ab0d5b6@collabora.com>
References: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
	 <20250115-dts_mt8370-genio-510-v2-1-fc9b01d08834@collabora.com>
	 <83a354d0-e220-449e-b03a-12012ab0d5b6@collabora.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_012607_654567_F442577F 
X-CRM114-Status: GOOD (  13.59  )
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

On Wed, 2025-02-05 at 15:21 +0100, AngeloGioacchino Del Regno wrote:
> Il 15/01/25 11:29, Louis-Alexis Eyraud ha scritto:
> > 1. Add compatible for MT8370.
> > 2. Add bindings for the MediaTek mt8370-evk board, also known
> > as the "Genio 510-EVK".
> >=20
> > The MT8370, MT8390 and MT8188 belong to the same SoC family.
> > It is a less powerful variant of MT8390 SoC and their main
> > differences are:
> > =C2=A0 - Arm Cortex-A55 cores number (4 vs 6)
> > =C2=A0 - Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
> > =C2=A0 - Arm Mali-G57 GPU core number (2 vs 3)
> >=20
> > Like MT8390, MT8370 hardware register maps are identical to MT8188.
> >=20
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
>=20
> Since you have to resend the series, please remember to add Conor's
> Ack
> that was released in v1; in v2, this commit didn't change at all.
>=20
> Meanwhile... please also collect my
>=20
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
Hi,

I'll add the missing code review trailers and fix the commit message in
the other commits before sending the v3 patch set.

Regards,
Louis-Alexis

