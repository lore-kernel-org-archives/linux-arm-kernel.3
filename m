Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FC4F53D96
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 20:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdkEDHHvYSDKqQlaUMVlbR4Vu3xEbNUK1yLJc/kMm4c=; b=UMo5eQpax/UiBmRNG5RzOdfMjH
	2Ek1uCQVxQRnbGKMkt7iclmSko2MpxZi4qrJUPQuzmgXVs/aRM8NF6Lnh49NdOX8DOaghUvfxWoQl
	MnY6mIoUOSzVfJ0QYlduw7jCpwKawW9x9nnDca6NH7BZmzZDZohxT2vtu6AqIMq5Y5nKROudBc40r
	FDIVw4p0byg58JTl84DJXxgXS8V9xaFmP1AheFVl+oIhxSw7YIjSVypZbr9PjtDsH4tTOTi0TTNLb
	Qoj8sXUs9ng5iMw8T+oAk6dfj5Vjiw/gD4Ue+AkmpjXDMLvs+OlN7i0xNbJ6Qv1nGp0Ik64IwfjgX
	t7QbdGWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Eyo-00000004r7T-2U0f;
	Mon, 16 Mar 2026 20:56:02 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Eyl-00000004r5d-0uhT;
	Mon, 16 Mar 2026 20:56:01 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 37D3EC0004A7;
	Mon, 16 Mar 2026 13:55:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 37D3EC0004A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1773694558;
	bh=4MsnwV8ofhA42oylzau/+l5Il2WxZr/A/QgRheBsqb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PrgoY3MLGsIxAUdIHNp//61o5B2ywqe39US3e2qAnowj4JbEtQ+94jflfv6jBDM5j
	 XGoANqOZJah3SzIb+PVFcgxTgIIrrBC1WL74f0n/j3Vz3WEcMu5Cc/vAAJxQVBzZXa
	 EdjeCa9n2Zd5bvN4XJTZjCuStSeosOnIqXxACh/g=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id CDB1DA83;
	Mon, 16 Mar 2026 13:55:57 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Gregor Herburger <gregor.herburger@linutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] arm64: dts: broadcom: bcm2712-rpi-5-b: add pinctrl properties for csi i2cs
Date: Mon, 16 Mar 2026 13:55:57 -0700
Message-ID: <20260316205557.2146987-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226-raspi-dts-updates-v1-4-60832d20ff04@linutronix.de>
References: <20260226-raspi-dts-updates-v1-0-60832d20ff04@linutronix.de> <20260226-raspi-dts-updates-v1-4-60832d20ff04@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_135559_328599_F2C3F711 
X-CRM114-Status: UNSURE (   7.59  )
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

On Thu, 26 Feb 2026 09:55:57 +0100, Gregor Herburger <gregor.herburger@linutronix.de> wrote:
> Configure the i2c pins for the csi interfaces as i2c.
> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree-arm64/next, thanks!
--
Florian

