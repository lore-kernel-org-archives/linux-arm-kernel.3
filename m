Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6426D116F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 04:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjHabM2eiD0jixmAKaYzKnfVOeI+Of6+DzrvbJxtRBE=; b=M/opEFih3O80JibupczTaaYtWf
	Xk8opgE60mJDV7TlJratBTWP4tZAUt7RtZOtSM0xhnzP7hu3jjN6IquxOWjgV1yjnE6qT9ZKfixZz
	+VU1shQbsw7bfaxsnau4Puq+fBBkwol7qAMnQah+CDO/TZYhv8W0xJIu8i0mPx7VkmMPumEuPzT5m
	45NBzxwz82n8NmYor4a3s1tDEyJJkfO5HCZbzFQ3yYiX8QqfSeCAskiwVhhNq9xGMRh92yv+fQTE/
	7nrd8H8gqDf+QhRT3R2BcBvo86YSy1i6outZqmGSxQJFh50G/LPxqjaKCL5XH9sz8nIb8C+pxZETo
	dq5uaylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQHwF-00000004maI-1h1E;
	Tue, 02 Dec 2025 04:24:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQHwE-00000004maC-38J7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 04:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBA906012B;
	Tue,  2 Dec 2025 04:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A7A4C4CEF1;
	Tue,  2 Dec 2025 04:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764649469;
	bh=cRg/1CaqqZPrJW4h+GCNv/Da8WjfkimOPAM7FixK0Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBqd57c8AVkKeH5vatUw0RzirAcI6+nz/gAZJGANUWKWmymfiWuJH1UbJBO0hnHy4
	 sdfid1ppnWyOuev1UqMxR736qxw+jPN/BpvsbsXHs4fnso32QuWW1zrCINxVHAqqoF
	 yNfFsx2Ry4lLfn8aP8oaZFn3fwnbU4Et2OP90YJJkDe6D00NXGfmc54dnx2fsHQnkK
	 zaHjhy0MSBfNafYH+EQ1XJcanzQJe5MPU2qQR5+vUJAHVKoe2UAv4idpGgywWZD8Ou
	 qFOySg4ZwIVAn+NaHxFWvMOevkrxk2eLBTKSsowmi56KDSQci6jbODK7DfwH32rrZq
	 f+dLhGrxKtUcw==
Date: Tue, 2 Dec 2025 09:54:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, linux-pci@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: linux-next: Tree for Nov 28
 (drivers/pci/controller/dwc/pcie-nxp-s32g.o)
Message-ID: <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
References: <20251128162928.36eec2d6@canb.auug.org.au>
 <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
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

+ Vincent

On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> 
> 
> On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20251127:
> > 
> 
> on i386 (allmodconfig):
> 
> WARNING: modpost: vmlinux: section mismatch in reference: s32g_init_pcie_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: .init.text)
> 
> 
> -- 
> ~Randy
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

