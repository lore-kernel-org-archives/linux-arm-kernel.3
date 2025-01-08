Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D32BEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnUtdVeAl9f5S/7YxL/35itKcHxkPimGo8xC8m16xO8=; b=oKao4M8q9kXleooh5dvVrNY8kZ
	C9me3ZbNBGJtSvISXQ8izT/x6ipGoKnN9zKrsAX74aDsUH5Woean9s25jWFMQtluKFteagoefYe2e
	3GOMLuGBoYsS+GkPH3/usM1zhiM+p0ZU86BpSqXhhU9zhsLFYsqvx5m9FhEB8v0284BxsQmScojwT
	+1KzlyXh5JHbhld9+Zx21a6Tt7P77Bfsn6evdaJbDM4ys6gOwxcCAwGsc2pv1wCA7tAeLsAUYdQx+
	x0RJkZO4hHe9u6OJslQc9H9ZPpLX9RMRzTVDk3hl++tZKqDzmF6FFbLHWEeVoTWdzrjZyze3mB3aq
	SmJalRCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVZB-00000008VfD-0dPx;
	Wed, 08 Jan 2025 12:53:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUle-00000008LMa-4BnG;
	Wed, 08 Jan 2025 12:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nnUtdVeAl9f5S/7YxL/35itKcHxkPimGo8xC8m16xO8=; b=e1ulK9F+oYU38t+ceqPDEteyQS
	O4RfnLWkFEQPJrrdOl/cZ1y/eZY6TXBnMa7CqTciyZLEtGrnfdB9B2J7kU62blj+uayhjf/dORrnw
	w8T1Q5ARPOXIPD376RFmj7SPwFDWg2vSZ4aGCXydrCKy5Utv30gK7HokHnzyRGCIRHXqfp4YvIZQK
	OqIC5gtjUSzqOiggIAGziDnmppIrqb4iOuAo51MFfiJ/wyyktrqgBxonNleiEVuTXf8YjsDQ77sr6
	i4+cMz1oi1JWJtNrsBzMP0N9hitiDVg4fFnotXgahhMHtY8RMijvkuN51cKO4DOsfgTDN6jSGScWw
	A/EJh2Xw==;
Received: from i53875aad.versanet.de ([83.135.90.173] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVUlc-0005Xv-QP; Wed, 08 Jan 2025 13:02:32 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ivan Sergeev <ivan8215145640@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v7 0/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
Date: Wed,  8 Jan 2025 13:02:21 +0100
Message-ID: <173633768684.2772122.3565189934463718842.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106-bigtreetech-cb2-v7-0-565567e2c0a4@gmail.com>
References: <20250106-bigtreetech-cb2-v7-0-565567e2c0a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_040235_031527_8FFA4020 
X-CRM114-Status: GOOD (  12.14  )
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


On Mon, 06 Jan 2025 23:50:53 +0300, Ivan Sergeev wrote:
> BigTreeTech CB2 and Pi2 are Rockchip RK3566 SoM and SBC boards made by
> BigTreeTech for the intent of using as a 3d printer control board.
> It is a successor to the Allwinner H616-based BigTreeTech CB1 and Pi, so
> the device trees for CB2 and Pi2 are also done in the same manner: the
> common nodes and properties are put into a dtsi file that the
> board-specific device trees include.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add BigTreeTech CB2 and Pi2
      commit: 1a623c642b4066a5cea751ef52ab109b65e8afb5
[2/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
      commit: bfbc663d2733a42d93143a91659e82c8a13f5a36

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

