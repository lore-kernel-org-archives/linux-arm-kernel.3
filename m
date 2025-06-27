Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62C6C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVPaUJqCY8ceVuswXPqSPTKh9rTcLJj6phtzFkBlZj4=; b=cqB7UAmLnG7h9+TuaxTCJAM8Ww
	9KJ9A5acxPplT6F0L3WfB6TmUCPLAL2rJ3qrFbOPxeS8d/YMbPX/z3iYRh5flkk+Yc6XEeFAoJZkd
	kLSd1/Y0TX82fJhwGEpilzxqtEj+m7gHydShJ+C/4AWqztjqRghlyP+2ZUoGY2tj/QNtJbudA6u9n
	/VKEEElvMZDs7pwznoNVNLipUMbyDxMrolroc3ym1AurOwvEDy7JgS+2GKtZLPR+MvkHmRNXpNa7t
	qoZjfbHLA7Pwlm5EICWVmEKc2xnUa6Prb+m2NXfbG+uvEb9SkqjNgiWsTnuH5oXWLfuE5iS57TP55
	CQmRwC0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV38u-0000000DmK7-3tkA;
	Fri, 27 Jun 2025 07:05:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV34c-0000000DlXd-3QaL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 07:00:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0AF09A521EB;
	Fri, 27 Jun 2025 07:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4F5C4CEE3;
	Fri, 27 Jun 2025 07:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751007633;
	bh=2Uk6mPLluwOGTpyaSNA8mE4z75MK59plAzgVuBSAIJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPlmnBFlKtkL68K7UTMLDKSF2L3+BrpBxHEC/wc2OKDzTpGBqVXnSnK/TfYEHNsFL
	 ovV7Jj2Me76edKk5EVcbp3YdUDhKxrmksObBMW6m+w8sFWO62FkHxQA6QCXHrtWEhY
	 FR0CQZgCyzgMYXzjnhhuGoc3XsnRjwYZIna9+GDzLtmc13KExsjUldUTh4I4XXV/6d
	 8kUfvWRCv8HpCh0xjXMEs+MqikvpEr58IavaEPEctgOexAckVTsfV0tUERIte3t4IV
	 ZGK6AygZqDueGEwAJ0bZsxTqs3LG9RenKfWXKj13vL5haKXqAMI7RDrODv9ob70UpH
	 rhQM+nWdK1M4Q==
Date: Fri, 27 Jun 2025 09:00:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leo Wang <leo.jt.wang@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, bruce.jy.hung@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	Leo Wang <leo.jt.wang@fii-foxconn.com>
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
Message-ID: <20250627-banana-falcon-of-jest-c0a8ec@krzk-bin>
References: <20250627-add-support-for-meta-clemente-bmc-v4-0-ce7ff23460c4@fii-foxconn.com>
 <20250627-add-support-for-meta-clemente-bmc-v4-2-ce7ff23460c4@fii-foxconn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-add-support-for-meta-clemente-bmc-v4-2-ce7ff23460c4@fii-foxconn.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_000034_919542_303F0DAC 
X-CRM114-Status: UNSURE (   8.04  )
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

On Fri, Jun 27, 2025 at 10:59:03AM +0800, Leo Wang wrote:
> From: Leo Wang <leo.jt.wang@gmail.com>
> 
> Add linux device tree entry for Meta Clemente compute-tray
> BMC using AST2600 SoC.
> 
> Signed-off-by: Leo Wang <leo.jt.wang@fii-foxconn.com>

Here as well

Best regards,
Krzysztof


