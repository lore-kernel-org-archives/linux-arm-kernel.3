Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AF4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 07:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ni0/JXBdNOrRusohFjRxi3utlOmJOryGodrzHL5Q1yM=; b=OgzaP45ATVn/+oLeP7o8Lw2uRW
	PNWwJTk9Ti5u3GPUbCQ6a68awNvnCf/qj8XQKUjXwkyZH29xICgbsDjR7mY8ZNFS9vLkaBiNyOfv+
	eLcqEhOr6/VRsi4sjZux0TdU4jREBDwASVSDrs/pB/3DGkCxg7aPyFJmWnbxPTPaHpcO6vgh6e66h
	jEncB2ZrJOmQZXglDScwR5H747CVIEYbOe9Xt1HVEj1XINe0xU36d7+v/acX56353PcZvkDFk86P/
	5Kz+y4GpFvW7iSRidmLRfXW9LyGdf1HbiXq6xfkbUX4uLjMGlkueD7lgEhZ9oiacAF9Tow+c9KdLa
	WrlLjpvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSA7Z-00000004ioz-1oQX;
	Mon, 30 Dec 2024 07:23:25 +0000
Received: from mail-m16.yeah.net ([220.197.32.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSA6M-00000004ilJ-08JT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 07:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Ni0/JXBdNOrRusohFjRxi3utlOmJOryGodrzHL5Q1yM=;
	b=NETHTdzZPxV/6p/IBSYZ+MiJK/VNwXVHn+DM2oh2TVefCARJrwhk7stAltdKs5
	BK/4w7piqUwQxv8LUHufQYBjLoWI+vng4TvFJTPLLBsYEH4P+EHHN7hCdK/0HDJ1
	kBLOqP/vjyzTWSv1D7pxGNC5Zmd8A32NL0ce5hSSGy66g=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHbinJSXJnSekeBg--.61568S3;
	Mon, 30 Dec 2024 15:20:42 +0800 (CST)
Date: Mon, 30 Dec 2024 15:20:40 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2 2/2] arm64: dts: imx8mm-phg: Add LVDS compatible string
Message-ID: <Z3JJyDsHSpH7jJuu@dragon>
References: <20241210105705.116116-1-festevam@gmail.com>
 <20241210105705.116116-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210105705.116116-2-festevam@gmail.com>
X-CM-TRANSID: Ms8vCgAHbinJSXJnSekeBg--.61568S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrKry8tw43Jr48KrW5uFWkCrg_yoWxCrgEkF
	1FvF4xCw47ZF48JF15Can5JFWUua1DCay3Awn8J3yqgw1v9FyrWF15tryUJrW8ArZxCr97
	tF45X3s5t39rGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU08MaUUUUUU==
X-Originating-IP: [114.216.146.204]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgXFZWdyDiXY5AAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_232210_483897_E06C8186 
X-CRM114-Status: UNSURE (   8.66  )
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

On Tue, Dec 10, 2024 at 07:57:05AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The imx8mm-phg board has an AUO G084SN05 V9 8.4" 800x600 LVDS panel.
> 
> Improve the devicetree description by passing the LVDS compatible
> string to fix the following dt-schema warning:
> 
> imx8mm-phg.dtb: panel: compatible:0: 'panel-lvds' is not one of
> ['admatec,9904379', 'auo,b101ew05', 'auo,g084sn05',
> 'chunghwa,claa070wp03xg','edt,etml0700z9ndha', 'hannstar,hsd101pww2',
> 'hydis,hv070wx2-1e0', 'jenson,bl-jt60050-01a', 'tbs,a711-panel']
> ...
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Applied, thanks!


