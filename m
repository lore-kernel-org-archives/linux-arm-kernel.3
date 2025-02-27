Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A22C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 22:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHU3dhEYskWbI85RowdDZTLXbFGbdRE7ty47cEABw8w=; b=Lf/xL7nrrsMKkaQARoIOY50Stv
	/EcPeDSi6vIzCjfybU5KSNumVIE4yPy0RYUJXDr+o1rLDjqsoXKYokxbTu+FiTcKmjagFnBGLeg4k
	Z+HAYdjtWbEX4NaRJE+0xluM+DadLqyXEnVYJx3RnMg7oMN/x7YLtUboUJ+b9DElO1f7H6536/X0b
	+pLZ7f+Me9DZA+DqYbzgNUJkqvpI+VB8l6YqT50P4KEf00+vDXuwc2w2YJ5vnTyCSfIvDJM+yFGSj
	6fc5ANAeXjNMwuUEAh0FqkKRNmnMyd7n4/bhPmcG3wAbs8HxH10T63p/+MTwUzpytlQ0vWtXtZcEy
	kA4cgbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmSF-000000092D4-2Avw;
	Thu, 27 Feb 2025 22:34:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnmQd-0000000921W-0bZ1;
	Thu, 27 Feb 2025 22:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A0195C1083;
	Thu, 27 Feb 2025 22:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161D5C4CEDD;
	Thu, 27 Feb 2025 22:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740695543;
	bh=k6e8ofzrBt9aHKWkZMG3dJtLmoBrQbP6qnALTS2lQdI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=H/hNhaWAVRKKe3XZoM8aE+Jxa6aolkEyh1d6I4j1+iH+3E9HGKKLb9LdoFcJatXsL
	 eDcqBLfAPj5Z6OWNkystoQ0BqtnVavVl7/masmi+87CnxdmkDfggsT3gIdmexq8jvX
	 S19uIXKOBnZzJQTOya790x0e7iKBTnrYoIDuSYij2rUoGvPeuWX4KnBTtJdyi8Gzy9
	 bn5ZM9IVamjZ9/1wIPh6jCP8QlCm/I1Ppb//1UNOaIzJ4xPVHqXORoM1LIIP2tU5bJ
	 N43UcaPi1aKd4kcATSus3TbDuEEmxi2YauzUK4xpZ1Hr1GOcDZHOXpIaTdZsNrw+zp
	 cGktaOohkmQ3Q==
Message-ID: <14dcbc0a6000aa43feda3681a3ad7548.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250221075058.14180-2-friday.yang@mediatek.com>
References: <20250221075058.14180-1-friday.yang@mediatek.com> <20250221075058.14180-2-friday.yang@mediatek.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188
From: Stephen Boyd <sboyd@kernel.org>
Cc: Friday Yang <friday.yang@mediatek.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Friday Yang <friday.yang@mediatek.com>, Garmin Chang <garmin.chang@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Yong Wu <yong.wu@mediatek.com>
Date: Thu, 27 Feb 2025 14:32:21 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_143227_224955_28BA2CCC 
X-CRM114-Status: UNSURE (   8.34  )
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

Quoting Friday Yang (2025-02-20 23:50:53)
> On the MediaTek platform, some SMI LARBs are directly connected to
> the SMI Common, while others are connected to the SMI Sub-Common,
> which in turn is connected to the SMI Common. The hardware block
> diagram can be described as follows.
>=20
>              SMI-Common(Smart Multimedia Interface Common)
>                  |
>          +----------------+------------------+

Applied to clk-next

