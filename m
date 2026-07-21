Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633B3C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 17:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECtgOxvSeISZN2jNkuoGR5Ves4oScJxU2/3FOM++5og=; b=OfTMZQRPJf7F7TPvdxLQDCoH2k
	tY+DimcoKM3EMk9lvFKAhIPg7nH1lCbDyyOA1ul6r7ZZQnvZe1tYbIfjukhzNwYIxhvdyvirQDj3P
	SE8JUCeAoeLTOc0+fzOn1lvLHe+hJDnDFLgLdLzLanwHXKDQq1dGoCNSYF4T0/1ZFqpNwy8ZXrSRg
	nP3i59855s6XnXpOIF1YBzUeH73VRrNQyQayiFlBxU7dqUbsX2k7htni5zsaaXXFDrVA9JYXZ7ziZ
	DutWPOH7wa8HGHtshwCPRPYNfMD1Mui/gg6ylnNu4FeNz4fpjsUuC2oCCzwyBUorYKXFNdhDAuu7m
	b1JU7LkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEGH-0000000A3Zd-0Kpy;
	Tue, 21 Jul 2026 17:28:09 +0000
Received: from lpdvsmtp12.broadcom.com ([192.19.144.207] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEGD-0000000A3Z7-1s3A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 17:28:07 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id A3A57C0003EC;
	Tue, 21 Jul 2026 10:28:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com A3A57C0003EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1784654882;
	bh=K4Wr3hK/UeHHvOLabIegMMO1mwkuMYZ+mzBNeFKYGwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F4iW9WVFig6J++p3ES34hq43vCeF3AjO4f8XSYk3bGRuFQdgN2zEacZSG0HSQEcWN
	 AqLBx5uw1XHaMMSUxCHG6GXA2As7bWOQloQGhkQlSLpNKdvoIU9wa0xwyywx5lumYY
	 /WAVoNxUgMPju5oYfPu+3lW/veJ/MiM3ryGaqNoQ=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 3FCF9ACC;
	Tue, 21 Jul 2026 10:28:02 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] ARM: dts: broadcom: bcm7445: Correct indentation
Date: Tue, 21 Jul 2026 10:28:01 -0700
Message-ID: <20260721172801.3591970-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706101920.341586-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706101920.341586-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_102805_551208_919FCDC1 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Florian Fainelli <f.fainelli@gmail.com>

On Mon,  6 Jul 2026 12:19:21 +0200, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Correct spaces or mix of tabs+spaces into proper tab-indented lines.
> No functional impact (same DTB).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian

