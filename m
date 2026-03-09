Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8B1EA854B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A8oIwYfb33qiclTPcfWWyQsiQRrYjyN5cJw/36JWcko=; b=Gfl79IG+SJjr+WYB4eGcrGGAoQ
	buEAXo+GqgAgUt3ncR1PVYyQ16N518Uyi6R/dtXZPHlm8dfbDPzbh/40gjGwtpn4DcZhdtAKQlZW3
	00vQ44LARpgxFZWJiXYbFpq7eXfQo0A8huL4aGL2Y9cOrL5YbZQW85LIc4HHNxmFGsPZyzaNpI7sc
	Hfx3vhw5mnn77lF5h89miiwQ8DPJ2qakFB/KCscNeBMkGCAcfBetzlCdTpWeKnLDCXw9gOFZEd/Vh
	oX0PhGOODPGBIB4xDZ3ac2WV9ZU4soCg5mj9Ugeo3/wAGRjd++iR++meW/LdtN2PxNBx5zot+9DXa
	mhi8QudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWds-00000006w9P-1pUu;
	Mon, 09 Mar 2026 09:11:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWdp-00000006w97-0Jjw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:11:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D94E600CB;
	Mon,  9 Mar 2026 09:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118DDC4CEF7;
	Mon,  9 Mar 2026 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773047467;
	bh=WLv9qqLZ/btidVarDfm4uY8aB7MnPY0EpCVnateUiGc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WDo8xpt36yqSDDveDKlkl4R/SIZL/veYsmg35mJAhMPg7YRldiExyNtinsj/PPTly
	 VSmcZPI3Z9MCCGSd6qNfxh5TOA1jpadFRYEAVDc+7dr7pUnpCKq3NjqO5Z4KySEP/e
	 3L6xA7wkCB/bGFOAWOsTLeAlOQ905MRZDf3T4zVXPHF9Fs+4ic5fmghXgOLuS83rzo
	 qCoD3K2nUiyb5kwDk3gQ54/DlPP4X/LmsMaGIVjibq6eOkJifQ69gzPez2ZWjqn20H
	 Lm1MH1llAmrHZlm9qPfSOMG+WiNdVOVtFRWmO6DpIGJtAv4mpZ5ISYoMiw5VHbUcwU
	 4FJa/iKytuUjA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: arm-scmi@vger.kernel.org,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq property
Date: Mon,  9 Mar 2026 09:10:59 +0000
Message-ID: <177304738934.1267831.4681471282641940772.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
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

On Sat, 17 Jan 2026 02:02:28 +0100, Marek Vasut wrote:
> Document new property arm,no-completion-irq . This optional property
> is intended for hardware that does not generate completion interrupts
> and can be used to unconditionally enable forced polling mode of
> operation.
> 
> With this property set, such implementations which do not generate
> interrupts can be interacted with, until they are fixed to generate
> interrupts properly.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq property
      https://git.kernel.org/sudeep.holla/c/0c5453bf8437
[2/2] firmware: arm_scmi: Implement arm,no-completion-irq property
      https://git.kernel.org/sudeep.holla/c/d8283ac2c8fb
--
Regards,
Sudeep


