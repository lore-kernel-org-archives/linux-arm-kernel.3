Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0757C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crecp3yT2SZLjBUhnRURx5oUzcLwjGoGZoCGTxx3isA=; b=WYXJgx2chz/7gi9/Zr+pOesb30
	5uaB/D7IPJ8eHJGqyDG4/edxOLHVSvX/kkzT745eLsO+tJGR6Autudm3qxMCkI7/2Yiqe+83mjyUd
	eFJXw02j2dE+YjKXeWOwQ2A/Hycx+D2+JQ0A2iJtN/NMti5dzBdU4G9esHwmMy+kifSkO4OXCwmPW
	RZpgwMVltSmElNopW/s5BWmeZzQIyNX3Yjy72RdxM6HHBzLdaJlwXESvzX5H7eV3rd/OOxXuLKUzF
	4xipIl6KR6PGaBNzhV46M+BK5TqN0hxOaORCZ+VSyI+Tnvn+/gOe8tbWkJsXZ+KRSO0ixssIZ29d2
	6fA73ZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8V8-0000000EgG2-1G5L;
	Wed, 14 May 2025 09:34:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Cy-0000000ERuf-3XPP;
	Wed, 14 May 2025 08:11:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747210279;
	bh=crecp3yT2SZLjBUhnRURx5oUzcLwjGoGZoCGTxx3isA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Q3ohjz62grUXQrGlMZmV14eAlrlnVDazHA+kNoz2opWnap5zMJoUYEri+JOLeIYO8
	 1l0nsxPkr994hI4PSEzVqba64Tny61FlFN9GYmwZXDIcEbJytJe8wMjSSDJ6/m/a/F
	 KBEHwPY/ovWtKaIUnBWPpxBf/47bWFJxiX5BXB7JRTdOCtT+uhs7MM4GbkO2lCH5pG
	 PBscEESi+ceSpfJQemzEQlTpCgHHNKqqPKaVScAqm/LfvZUAhTKNozXL/ciOywe1EI
	 78hMJbuWrXrtrJ0e9n96xwF/euvGBiCyWFaZ8JJxOz/FZg0UxTUK2ZKwa1EX6tA9ws
	 bazKi7SoCGEnA==
Received: from apertis-1.home (2a01cb0892F2D600c8f85CF092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EC67D17E07F2;
	Wed, 14 May 2025 10:11:17 +0200 (CEST)
Message-ID: <5578490565f6d37fa435ca0c02fcfc2cb685baf8.camel@collabora.com>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: mediatek: mt6397: Add
 #sound-dai-cells property
From: Julien Massot <julien.massot@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel@collabora.com, Sen Chu	
 <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin	
 <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado"	 <nfraprado@collabora.com>, Hui
 Liu <hui.liu@mediatek.com>, Yong Wu	 <yong.wu@mediatek.com>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon	 <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Tinghan Shen	 <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, iommu@lists.linux.dev
Date: Wed, 14 May 2025 10:11:17 +0200
In-Reply-To: <79148223-d87f-486e-9d51-979f9188a837@kernel.org>
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
	 <20250505-mt8395-dtb-errors-v1-1-9c4714dcdcdb@collabora.com>
	 <79148223-d87f-486e-9d51-979f9188a837@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_011121_037009_276368ED 
X-CRM114-Status: GOOD (  11.61  )
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

Hi Krzysztof,

On Thu, 2025-05-08 at 08:01 +0200, Krzysztof Kozlowski wrote:
> On 05/05/2025 15:23, Julien Massot wrote:
> > The 'mt6359.dtsi' file already uses the '#sound-dai-cells' property.
> > Add the corresponding property to the binding to fix the following
> > dtb-check error:
> If this is a DAI, then you miss dai-common reference. If not, you need
> to explain it in commit msg.

Thanks for the review, I will add the missing dai-common reference in the v=
2.

Regards,
Julien

