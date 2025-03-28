Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050E9C36013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 00:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+ra6T2kuA7+mt1Iw7ON824iAjkZzokAvi5uNjYApfw=; b=u6RT5YUdyBSDQZJIKkb1kqyYrS
	bRC5jDTqvxqFlLQsY67VfRAnGwSj816NB0J3WFn3JLVTI6u2e4GFM+o5RzvdiL1dRA0tEQC6oNMjl
	0ptgB3gazvdoIrN+HRDZ1ePiZBsz+80ZfJPn9TZXg9WK/MVnANXGXlStBg4WmTnNP8td5dgeVvKjO
	rfxxz/WnZXC1wff8xMdcyKvT3MxYhogLJ5xsDQYhvtkQYEmpbkji3Gg2Dg/An57mPfQahPAFBSvb9
	Z5EMPm+SjN4u8InBlMIBb+On2Mku4bq/Tj1yvRMVigW73SJ6xhu48B9X3g/VOBVajtNHIvrt4/Eqr
	h1S6GNiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txxtz-0000000CJBU-37zs;
	Fri, 28 Mar 2025 00:48:51 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txxsF-0000000CJ6N-2xot
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 00:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1743122814;
	bh=p+ra6T2kuA7+mt1Iw7ON824iAjkZzokAvi5uNjYApfw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=l8YUapQxzkeoWlqLL49sQe2NZt+CDE+Nbw6PPh7eZKP++2Ac/TSsnK1tiM8aLmjXH
	 ar97VpEYv4CJvV2HBzYiqAYvGRrXS5SX1+jOn8cZbD2UXHu0hG+ziM/hyTG7h0MAyp
	 eCrvBZPGJH/pl5yjqZGxCdUUZbbPn8RAshQSwN2XFyx4y5qhrlsHmE6fttMcr9p63Y
	 mWibmTpNIuw6aArxfyUc4gHIgIdHCwAgKe6okSnUvEjAtjpNnsrMVqHfJBpdi0NiFD
	 essgIYoScXVdiCnLgBILlmAyiayUxWWj4wNKzK4NeNA9WT/igeteJsm/lHbAnK/DGU
	 wBJTYZY0MyPmg==
Received: from [192.168.68.112] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C0E4C7BC5A;
	Fri, 28 Mar 2025 08:46:50 +0800 (AWST)
Message-ID: <d0f7003c22e19c8fc7617610043edc7be925a180.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/3] dt-bindings: pinctrl: aspeed,ast2600-pinctrl
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Willie Thai <wthai@nvidia.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, kees@kernel.org, tony.luck@intel.com, 
	gpiccoli@igalia.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Cc: leohu@nvidia.com, tingkaic@nvidia.com, dkodihalli@nvidia.com
Date: Fri, 28 Mar 2025 11:16:49 +1030
In-Reply-To: <20250324175926.222473-3-wthai@nvidia.com>
References: <20250324175926.222473-1-wthai@nvidia.com>
	 <20250324175926.222473-3-wthai@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_174703_951665_77AC1FE3 
X-CRM114-Status: GOOD (  10.15  )
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

On Mon, 2025-03-24 at 17:59 +0000, Willie Thai wrote:
> Add EMMCG5 enum to compatible list of pinctrl binding for emmc
> enabling.
>=20
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Signed-off-by: Willie Thai <wthai@nvidia.com>
> ---
> =C2=A0.../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 1
> +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git
> a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
> pinctrl.yaml
> b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
> pinctrl.yaml
> index 80974c46f3ef..cb75e979f5e0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
> pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-
> pinctrl.yaml
> @@ -276,6 +276,7 @@ additionalProperties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - BMCINT
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - EMMCG1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - EMMCG4
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - EMMCG5

What pin configuration does this correspond to for the eMMC controller?
These groups aren't arbitrary, they correspond to the 1, 4 and 8-bit
bus modes.

You may have added this squash a warning, but I suspect the pinctrl
configuration in your devicetree is incorrect.

Andrew

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - EMMCG8
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ESPI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - ESPIALT


