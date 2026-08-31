Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAFCC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6/gR54E6oPAO0ZYT1ptCwiGgBWPwLQA/I5bPLxrvok=; b=p7FghAiV5diUK23Cy4DqxpZNem
	5INcApOxYpZFQHg7imqJSx4Lu7MPa/p85Aj+fVcjqQ/XSaCbZPgJ9sW1pabZQMLvswB8TpaKCX+Cx
	IejtcNWtF9szeKZCIBQ7sa8auXvAQH1CUUGTtg5e1KdLPwTfDq1i9dNB35p4JERL1Bu4YWIalUcCV
	0waWsuUNI2edI/8+TrFd/Ll5yeqvruTz4x7TgRTcMDnY57Zv+ZsvJKBYxd+iP+aiUXnslD2T9A7v6
	QCTtHexYDRP+FahGz5hLnUi7LtfYEKvBbjTjVvL57FAZHq/575Zq5yVrdilVLAvNyGC2bTD2Yp1aX
	vZqxcoog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12FD-00000009SiI-1A6Q;
	Mon, 31 Aug 2026 13:40:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x12F9-00000009Scp-0lcq;
	Mon, 31 Aug 2026 13:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=M6/gR54E6oPAO0ZYT1ptCwiGgBWPwLQA/I5bPLxrvok=; b=w5PNVfsLQutLaDVN/Qm19wDlSV
	A9TfBbyADHaddupHuqdj2Q6ru9HkuOwORabxepobgQEapNPiPwukZP6IL/YaR5sWFPF8gwwVM0Lz6
	uKB8qKh5SGClm0DMv5Hfw/XPbB5oPmHQ63NJLY4+Uo7ZgeMrUxHp4AlisU0Ah//FVhYSPqTQEjhpM
	5azymwbDRkt9phrcfE7IQPbOzGQKqufEuDqPhaLVMdd5VowaACZJu+lbpNRtfWknlEKUYhKmFrCgQ
	3SSIrzlOD4nB9fGcerhD+pncf2WQq47KF5PW41PlH+ldLWkpDo/IDLkr7zd+EmNE+laC9125J4uN3
	oHwl6mGA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amin Gattout <amin.gattout@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: correct rk3576 SDGMAC GRF reg size
Date: Mon, 31 Aug 2026 15:40:00 +0200
Message-ID: <178818359737.1934409.16083582780928081843.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820-fix-sdgmac-v1-1-38e8d222b933@gmail.com>
References: <20260820-fix-sdgmac-v1-1-38e8d222b933@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_064011_223908_DECB6676 
X-CRM114-Status: UNSURE (   9.18  )
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


On Thu, 20 Aug 2026 16:25:53 +0200, Amin Gattout wrote:
> The RK3576 TRM lists the SDGMAC_GRF register file as 8KB. Adjust the
> reg property size accordingly.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: correct rk3576 SDGMAC GRF reg size
      commit: a3827558c623db5a4f7033f3cffe214577470df9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

