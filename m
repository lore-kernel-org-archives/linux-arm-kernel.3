Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3519CFCC9DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E3LnZLWj7Gk8mfX7i4o5/JcU3ncWfdEk4XN75StFNl4=; b=HsW7+pB5DkenHR
	mh944KNwlinFV9DpOln7m4g22+LiSS8yTcs0ymY8lOy7RN14iQubuPpt0prVYv1ogbRQeGMIlwFij
	rxyhfnLVt5ki7Fio8651D40119WHxoc+LZdTds+b+iXWBBr/6sz467znv7eGfDdTennyGZow2maF1
	WAOiqMadKWEnC+KVV31hr+66lf+o0aWE4ORpztkcF3bVLjq2116JtomWpKV+/6JHvOoRa2GvjZgXG
	X1RJawVnECiwQgnFVZxdbO66AvGmmN32+4HBnKjrTi3NZ7ApDxHFNWPEghgbCcOk2RIsZU8nGTHw3
	fG+jLx7i2YSSywbgU7oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsfe-00000008y9W-4012;
	Tue, 10 Mar 2026 08:42:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsfd-00000008y7B-2GOI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Mar 2026 08:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=E3LnZLWj7Gk8mfX7i4o5/JcU3ncWfdEk4XN75StFNl4=; b=k++0rtJLMuoQIW+CYQ7JGBqIJF
	iCyBBtyo0DH/SwylWdnvu9/O6MWLfyTtRILBktAzmSUJdETJP7OZzifJmBxuKItTjaxSnngiuGjiE
	FgrUU/JMPlNgUPosldZMblJE9xBfuKIeIRbTi+iPwk53oI9Cop7vV6NToegDIMAF6bHs5aQOxh+gb
	h77oJB0bNxrwk9M6t08idMOvN0Kfk0MnlwYCSqcAoxHDnIvk98x397KTsnYK1SrivWRvkXMkcNdnI
	hpGa01tCrrv21G/LDP/PzmAwRAkkOjP5VyJi1zUrnL5vAxl60ZTSuzByFDbiCZYBUduLHX+Permgx
	GCLta6IA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzsfV-0000000E0P5-2Uqu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 08:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5675944556
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:42:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C61DC2BCC7
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773132140;
	bh=+hdxOVwm077ylsjLu0wR0T6SVFeW4T69FussqsDDRHA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=GTvciSqq+x8/zCMOtuyLli8n1vUX944BWGl817kV9StHpWn/ZCnegugKuRQsP31zc
	 BzAgQT7AReGa+w9FNTeP0MAZpzB8BrfJNqjl8scrI0LyBvBQY7rG+irphiVi9e9Pay
	 H9kcdpBYkJtzeYMnQcffp0/6DqalOD85Ero6OlpmOhuOcyq6hlw5qVhAebzG2/YIXB
	 DnMhuDw8gGVkaM59hP3I087c+z0UZ4KsUJrbnznXy+njrrp6YDnmMQ++sMxHFuRr6G
	 HFUyohjET/eAy2mVYsy+9Qp1f3+sfdypP6FF2U5DFevqkN4m7+QA91ws+sAjszCwIj
	 fWqe+XRjm8C8A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a32d36396so41991221fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 01:42:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZN3yYRdN23UFutuqdftaiUhNuMNACN1oUnwwAHlPxn8Fy9uSKUGaaG7PXxCS18AG/tlqP6BuWrUeNg/XW5dsS@lists.infradead.org
X-Gm-Message-State: AOJu0YwfRwCkXb/9n0Mory5nljKhXRWyn0vejFhkv8RUPzVrucgALQ8m
	Mgb90DaFBkUBRdXnDH0uXzYcQLRsvkRHXOAiKnh6f1fj9OQpuzD1ah40Bc92Xmu4ZEXgSBw6r8+
	7o3D7xloCcg7C7S0Id6xtNKZnY86j1K4=
X-Received: by 2002:a2e:880b:0:b0:388:4329:c054 with SMTP id
 38308e7fff4ca-38a5d04ed61mr6094121fa.15.1773132138304; Tue, 10 Mar 2026
 01:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260309190842.927634-1-vladimir.oltean@nxp.com> <20260309190842.927634-22-vladimir.oltean@nxp.com>
In-Reply-To: <20260309190842.927634-22-vladimir.oltean@nxp.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 16:42:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v649jsoT9Uw5=gg5Zzxmgd4E04f8B8St_vUseP3JOrGG5g@mail.gmail.com>
X-Gm-Features: AaiRm50ffNFGTkd49hJolMVvUoYaIAAtO7JRlAyrrCfXMo0y-iPLjdkpqATmeN0
Message-ID: <CAGb2v649jsoT9Uw5=gg5Zzxmgd4E04f8B8St_vUseP3JOrGG5g@mail.gmail.com>
Subject: Re: [PATCH v3 phy-next 21/24] phy: include PHY provider header (1/2)
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084222_182923_11A9BB71 
X-CRM114-Status: GOOD (  15.92  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2026 at 3:10=E2=80=AFAM Vladimir Oltean <vladimir.oltean@nx=
p.com> wrote:
>
> The majority of PHY drivers are PHY providers (obviously).
>
> Some are providers *and* consumers (phy-meson-axg-mipi-dphy,
> phy-meson-axg-pcie). These are the Amlogic AXG SoCs, which split the
> physical layer into two chained PHYs: the digital layer and the analog
> layer. The DSI or PCIe controller interacts only with the digital PHY,
> presumably for simplicity.
>
> The rest of PHY drivers which include <linux/phy/phy.h> do so because
> they call phy_set_bus_width(), a consumer function.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Conflicts in drivers/phy/canaan/phy-k230-usb.c with commit 8787fa1da603
> ("phy: usb: Add driver for Canaan K230 USB 2.0 PHY").
> Conflicts in drivers/phy/eswin/phy-eic7700-sata.c with commit
> 67ee9ccaa34a ("phy: eswin: Create eswin directory and add EIC7700 SATA
> PHY driver")
>
> Both drivers are newly added in linux-phy/next and not present in
> v7.0-rc1. The recommendation is to drop the changes in this patch and
> readd them when merging into linux-phy/next.
>
> v2->v3: add conflict resolution details
> v1->v2: split in two parts to pass through linux-phy mailing list
> moderation
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c                 | 3 ++-
>  drivers/phy/allwinner/phy-sun50i-usb3.c               | 3 ++-
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c           | 4 ++--
>  drivers/phy/allwinner/phy-sun9i-usb.c                 | 3 ++-

Acked-by: Chen-Yu Tsai <wens@kernel.org> # allwinner

