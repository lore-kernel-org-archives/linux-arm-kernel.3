Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352E0CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GMg5kz65ccKVHX/a+K+NBL1Pp+ZE1LkwLEZuPO0SOM=; b=wnveuK+3TRu5c/46XSrGrKN4rl
	ga5U3LrNM2lTi7bH7RRJ/Dw+dPW42xUorjNUtcste5gvGgm3H5er+VbdgppyvsF1fl+xMt7m25H6v
	tY6Wcn3L3a9hBSJOtRYgpcYSQdtDgmkPr3AqJeKJFKwAVW8t2PCvNySyifh4ek2TcSoKQJR1oxxGs
	utsqNtUMkLHSb871SnkqeX5j4CqKDEF1fNERounv5uVTTkuAjsebGtRb6QxdjFhv+Tln+G6esDhGg
	RSbVOOrXXx24kIUR+o5TpcjUl26cZ0chV4/E7Xfnco2hOy2Qj01MAbLXolSiQChWo41Epgm1ESGGX
	E3tQWOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdcz-00000002NE5-1eip;
	Fri, 16 Oct 2026 08:49:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdcy-00000002NDr-2BD3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:49:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D87060008;
	Fri, 16 Oct 2026 08:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EA41F000C4;
	Fri, 16 Oct 2026 08:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792140563;
	bh=/GMg5kz65ccKVHX/a+K+NBL1Pp+ZE1LkwLEZuPO0SOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=akIDcMki/a1I5poNoyypeGbCXhvRvwN1XlH+yL+WF0P3kCYiPOL88fLa0uVBCRL7J
	 CZzXe7Qlu+x1ZRK9yhO2OkD8g3MTb0rUIQB4sPNLGz32k/hHFStGJuE5LfcKf+b/cX
	 PRw6irLM42ybL6TMDLoI1MrojR9VvD6bPLNAStWj07tuRJQDSYqU/qCEdkmm2xoA6g
	 qx48BgW6aa/gYkit/STZHK0SUVSnlPXfQhBZmVE9+BNJ7i45cDUBQumOzjla6U5WdB
	 3K7ePv+VMvVOZUfpasK1KSnoB/Ja8CYIoi5nkjAgciYWivR0z3L7tIw2zNesnAG69b
	 GTbJAB6Zh1GaA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH] firmware: arm_scmi: Grammar s/thing/things/
Date: Fri, 16 Oct 2026 09:49:16 +0100
Message-ID: <179214049480.148762.14846907069636180971.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <5128072dc75dbf239dff6c967a88060a4d64b3c0.1792137751.git.geert+renesas@glider.be>
References: <5128072dc75dbf239dff6c967a88060a4d64b3c0.1792137751.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Fri, 16 Oct 2026 10:03:54 +0200, Geert Uytterhoeven wrote:
> Fix grammar in the help text for the ARM_SCMI_RAW_MODE_SUPPORT_COEX
> symbol.

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: Grammar s/thing/things/
      https://git.kernel.org/sudeep.holla/c/16ca2aea66b1
-- 
Regards,
Sudeep


