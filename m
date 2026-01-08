Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455E6D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o74rYMK7NzoYdlxO6WrOFsv7JodbF5Y4+S8+5uIZBM4=; b=eotTxDS/bFGKXae4TXV3gzdqnj
	RMUGpD260IpD5fFfqZYDMKICtNdbcATXswFwAhfAByqCTKk8B2mPI3zL2lpHizHWNlKulXmnIxi0H
	UDE2xZu56Xz6UsjDo2IKKAqljJ4fcCV8Nc1f2i3OfpD9RXB4Khl4UlTcY4WoMqrCFYvrSMWyJd2MD
	+s04CyH85ihvY4KhZjA8Pme/KGmRrr10gPvaw8lsbpjvKhCJCo6oGhDyCnRwis6XL4d22OdLfM8uv
	JLc+gOlc5A4QzwDW0honyB0KS72xUzFw+utivJE6FlSO+Xs3m1kvwefuytIBe2VmOhJcQM0+Xk1JO
	2U4cTILQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtuC-00000000R2o-1Ypa;
	Thu, 08 Jan 2026 17:34:40 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtu8-00000000Qzk-0Vl3;
	Thu, 08 Jan 2026 17:34:38 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 17AA6C0005C6;
	Thu,  8 Jan 2026 09:34:35 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 17AA6C0005C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1767893675;
	bh=/KyvcfvHWyosG730uOsQN/0sPYQCXSe8bJOfXfsFNcI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MKJtDEtG2zbj+qr7PpkvkceZPszrBeLmi0FW4lfBTTfKD8fQs11kxgOgmwbgcvU9I
	 SF3i1+UkrEaGUu+52IhHHkXY9hrQYHSMrXTxVn38q+QNxhgJ8R92xNDV4lUBy2B5Wh
	 lKXBIa+URPHDNPAnsmbcpSAfw8Trtj7sXfNsI6Zo=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id AEC4E1CAF2;
	Thu,  8 Jan 2026 09:34:34 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/13] arm64: dts: broadcom: stingray: Fix 'simple-bus' node names
Date: Thu,  8 Jan 2026 09:34:34 -0800
Message-ID: <20260108173434.3784528-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106-dt-dtbs-broadcom-fixes-v1-6-ba45874e4553@kernel.org>
References: <20260106-dt-dtbs-broadcom-fixes-v1-0-ba45874e4553@kernel.org> <20260106-dt-dtbs-broadcom-fixes-v1-6-ba45874e4553@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093437_536719_CC637D60 
X-CRM114-Status: UNSURE (   7.30  )
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

On Tue, 06 Jan 2026 20:09:45 -0600, "Rob Herring (Arm)" <robh@kernel.org> wrote:
> Fix 'simple-bus' node names to follow the defined pattern. Nodes with 'reg'
> or 'ranges' addresses should also have a unit-address.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

