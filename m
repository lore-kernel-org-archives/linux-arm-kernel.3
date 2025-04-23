Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A340EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5l4syi+vsOLx9TsbcoUJ5lFu9Ul/Nq4MyN/nEXOPzm8=; b=YWxrOg7fp2qC5TuXWPNkgx0sIs
	Qpif0eXM8mJHAOI0EMKN0ANujlNBW9ujSW8ocvXf3XlZusIJSQFb6Eicxslu8/a7EWwHc8XSwrw22
	fuYNOd8vkcPU1VSaZp+1Rqt6ZqMDEELVrsc1q+aTtvZI89hMZ50yOGStAAMrMbWti622l9I73cAdC
	DSNixcY2ANTt0Yp2xzc6PaD1/zbpQryswr0kGKNl+IJSeCudqYNh6ivMOAOQPzrfrQe7YKYkd5Lx9
	M1gimBBo6XBtKCN9snkX9ZzglvcSA+2aHhwzaHi3E5qdAJEvpzj6TJRGNqoJnc/Sz7SUqOPn5nySV
	/CwqJBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e6Z-0000000BK6A-3BBO;
	Wed, 23 Apr 2025 17:41:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bli-0000000AvHp-2uuq;
	Wed, 23 Apr 2025 15:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2CAAF615F0;
	Wed, 23 Apr 2025 15:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF997C4CEE3;
	Wed, 23 Apr 2025 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421129;
	bh=rDayEnmW5wOjUNCI7vo/8BM3UfjynySd1YOsFEmc0Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lmauy6JiNq31WB8nrkpG+4X/sEHthcQJQm2py5Vba/EmUN9bzIRhSR0UvV3/zkITx
	 dGqyTsFQ4MTM/5leecxr54xpAW57wuUiBTQ7h9eWklX+q/7l6y40/qDaDPpwJhG+Va
	 xWZslDaKQkeSPAGLQGXwfO7zpv/OdzggwUNWaIbjX5YeTMUi03qR4caFTORBEIvjns
	 z5stAHX+gU7cyJ1ASUYCytTFa7gtSzeScWqE3zI8TU5EOFN72logSZZanzybyfYVqF
	 SHAiqUiWEdKGMuP2VBpdB5SWiUIbkx01wEx7PkG2Chytgur6o3doj7Pg1iazdD4y2R
	 BylRBMaA3C1PA==
Date: Wed, 23 Apr 2025 17:12:04 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
	heiko@sntech.de, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, shawn.lin@rock-chips.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/3] PCI: dw-rockchip: Reorganize register and
 bitfield definitions
Message-ID: <aAkDRIqIOjLo7haw@ryzen>
References: <20250423105415.305556-1-18255117159@163.com>
 <20250423105415.305556-3-18255117159@163.com>
 <aAjufPQnBsR6ysAH@ryzen>
 <352e40a0-65e2-499f-a7dd-904a4a7b19da@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <352e40a0-65e2-499f-a7dd-904a4a7b19da@163.com>
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

On Wed, Apr 23, 2025 at 10:14:57PM +0800, Hans Zhang wrote:
> > I can see why you renamed PCIE_CLIENT_GENERAL_CONTROL to PCIE_CLIENT_GENERAL_CON
> > (to match PCIE_CLIENT_MSG_GEN_CON).
> > 
> > But now we have PCIE_CLIENT_MSG_GEN_CON / PCIE_CLIENT_GENERAL_CON and
> > PCIE_CLIENT_HOT_RESET_CTRL.
> > 
> > _CTRL seems like a more common shortening. How about renaming all three to
> > end with _CTRL ?
> 
> I saw that TRM is named like this.
> 
> PCIE_CLIENT_GENERAL_CON / PCIE_CLIENT_MSG_GEN_CON /
> PCIE_CLIENT_HOT_RESET_CTRL
> 
> Shall we take TRM as the standard or your suggestion?

Aha, so the inconsistency is in the TRM... hahaha :)

Probably best to keep it identical to the TRM.


Kind regards,
Niklas

