Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF560C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 10:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tm4bX5EaMEcOm+KUpSmElRPonEmmie0f+X4ECTvvYHI=; b=IjcU+1a7WsFFhUwiP9ox0leG7c
	4mpCVbJDPLQkzNIuFODVZUzmw8qvM2n32+jkWZq4fd/a5N1Bwx51wQpioDOVAWlC42coE3/a2Cg5N
	iNMSQZOYLnc0Tb01D7Bcb8cPMYHTNlQLV+GBIesA/XBt08tCrdPgnfNPoAWhNFXmlneLDFwk3Wl4E
	N4Dnvt6HBS95ZtQkdKm96j9GY1R/ERHYbemQbOk8AxA50eSjTaIsLi1hX0a2kgtmmRgpeNKb9o7vP
	aqRMI7Pv5HhW2fM/Vb7K3faYQbbV5VyxH9mgVqu2E9P3mcDGP0TvtWIwEct/myqTRw6DYZQQ29zOE
	rRcznbGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIPn-00000002SzI-2ocp;
	Mon, 27 Jul 2026 10:18:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woIPm-00000002Sz0-24vG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 10:18:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAB60601DE;
	Mon, 27 Jul 2026 10:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE4C1F000E9;
	Mon, 27 Jul 2026 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785147509;
	bh=tm4bX5EaMEcOm+KUpSmElRPonEmmie0f+X4ECTvvYHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jYxixka0FlhauT4YJqj3Jfq5JgaoHCfQuUzMJ940VOmDeZ2ucrFT10LpKaeOY5aX9
	 Fsb5w94VOsRF+1E04eufzieRAL9zebAV/UEr9GkHBO93efzHnJQ0DngR2pSHa6LKJd
	 +FuvAr+gmMUSr8aqIKFMZVwWd/D1qTTjLq6RMR/bpST2nvoUyDmXhooRO5Z5g/2RcK
	 NlpFszwwKZ/FueD8GbXIeoQcouRlVvm5i7djRDiB9Os99FONj7gH9LS2Y62GBq+0Q5
	 TImTyF+igaEB/3WT6ZThTL/BNkADmgUkG+2hUrLnXUqRwzxJpHcuJXjd8lRGb7jDxI
	 jd7HvIhSy/8Ew==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] powerpc: Move CONFIG_QE_GPIO to SoC
Date: Mon, 27 Jul 2026 12:17:59 +0200
Message-ID: <178514745088.65524.3935355950831235390.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9a7131d15a94e2017877e628f0e97f9aa2e0aae9.1785140877.git.chleroy@kernel.org>
References: <9a7131d15a94e2017877e628f0e97f9aa2e0aae9.1785140877.git.chleroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=708; i=chleroy@kernel.org; h=from:subject:message-id; bh=uN4DlDlGUY5Xyerk30O+tWmKQX/egw2gDnpOL+pthDo=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWSlG0Qz821INK3tnj4tvcWuuDhDnvHzm75w1sots+dsm 1Bb3Xeqo5SFQYyLQVZMkeX4f+5dM7q+pOZP3aUPM4eVCWQIAxenAEzkqxHD/1IbnygBmyABewNf k6W31CSKzc/dcb2nKKO6Tz9s7i8RPoY/3MtW8bV8UmjQ67UI2mC3Y8XEf2kvrvlkTPB+8N3404R aFgA=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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


On Mon, 27 Jul 2026 10:45:37 +0200, Christophe Leroy (CS GROUP) wrote:
> Commit 7aa1aa6ecec2 ("QE: Move QE from arch/powerpc to drivers/soc")
> moved QE into drivers/soc including gpio.c but left CONFIG_QE_GPIO
> in powerpc's Kconfig.
> 
> Move it to SoC as well as it is the only place it is used:
> 
>   drivers/soc/fsl/qe/Makefile:obj-$(CONFIG_QE_GPIO)       += gpio.o qe_ports_ic.o
>   include/soc/fsl/qe/qe.h:#ifdef CONFIG_QE_GPIO
>   include/soc/fsl/qe/qe.h:#endif /* CONFIG_QE_GPIO */
> 
> [...]

Applied, thanks!

[1/1] powerpc: Move CONFIG_QE_GPIO to SoC
      commit: 6599935a1e4be0354326086ea6c73dcb8f43b881

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

