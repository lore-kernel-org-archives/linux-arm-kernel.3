Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08127FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+L+812ZE3FIB9FkYGx6SrckpLjGu++m3Er9AsDLCYY=; b=QeUjPuVADnPt+LbaspX01agMAH
	TD9AyJdu2d4u4u+EgHNs3xLI4u5skSdl9Zf5E8FdncFYIXFLul5/qpk1eXWwi58q3dU00wtactOYv
	ml1Pec5sSRvl85StOHeBIhMqFUiklHRyLgpRaeQKLpmAzRoTZ5DEli2rqFNKMcCrS7pJfrEN134EO
	hgdSwQqYRzGX5MyBoAv/HNfD+qOVkZuR95VxR5uw7qiOR2FNuQiCmbrqzgl3LPN5bbMAc5cCFxY0i
	topSZnpvB3XPER8uaXvEfamzEUE/lHJARuMC9ldHFElJJgodAGD1AX+TPJ189+TImhl/0gpYOoRj8
	lzVk6AhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHpM-0000000Gfha-3yKX;
	Tue, 05 May 2026 15:36:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHpK-0000000Gfgy-2xCh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:36:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEF3443C48;
	Tue,  5 May 2026 15:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63397C2BCB4;
	Tue,  5 May 2026 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777995409;
	bh=mVMJa3FLlsFImoqLFsKRghlowG3fcTKy8cBNX44JwE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DOTgxvSuiaHiwxHSak7ZubAjvxzhZsqxOIk2zvQJfzVyylb38J/g9x0875+LymX28
	 SRUJO2zMmT5FszOHM62GFA09vPcm8X+/LlSg3Knz9YrxA3rPJ2D8DPKWIXeYTC4WBv
	 2eEAt9h1XsiFEePaYn13rGxi0P6b5tq/xIh6ttcb1MJka/PKgct06s+884/GMENBt8
	 qYx+XR9MSLfN0/lJvQizsS35OXzEfMuz4Sq6F/VQFg3+hw5HLWPJyK/6HQ9WRbxW1J
	 KrvxMkElEsWhdPnur9OEa6d5URNyYgF/2aH/0tAF03A7jZLR99fgjzaW62edyBtWNP
	 xoPfMXHONlLCw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Marek Vasut <marek.vasut@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] firmware: arm_scmi: Miscellaneous improvements
Date: Tue,  5 May 2026 16:36:38 +0100
Message-ID: <177799538519.2896858.17495611577680479278.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775205358.git.geert+renesas@glider.be>
References: <cover.1775205358.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_083650_757674_551073D2 
X-CRM114-Status: UNSURE (   9.21  )
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

On Fri, 03 Apr 2026 10:41:28 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> This patch series contains miscellaneous improvements for SCMI quirk
> handling and SCMI instance iteration.
> 
> Thanks for your comments!
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/3] firmware: arm_scmi: quirk: Improve quirk range parsing
      https://git.kernel.org/sudeep.holla/c/6991e5de9709
[2/3] firmware: arm_scmi: quirk: Simplify quirk table iteration
      https://git.kernel.org/sudeep.holla/c/5be6732f820c
[3/3] firmware: arm_scmi: Convert to list_for_each_entry()
      https://git.kernel.org/sudeep.holla/c/145728fb616a

--
Regards,
Sudeep


