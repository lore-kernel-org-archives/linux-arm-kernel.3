Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6722606A326
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nt22Zp7v;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=pBxPxn5n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oih8i0WIyQznYHZo2vL+7dttn3r29EGnZfW+AikIH9c=; b=nt22Zp7vVleyAn
	QCJ5KHcCgPSShtLTQHgZUK3c6WxxY2q4Ydr1VPnx0+W7CSv7zYFVx5rz8TupUfeFDLYB9xnrT7Y/O
	51V/yZFa5aqyzibIWWDzSLgzxLXbMkhtocgcpSLV+MuAMbNlh1bu+2iIi7UilUstooqKWoH80JNKj
	Yk0DmVW3AKwquAcErca1ksnlEQO0Cd9w2YrrHcOxypRoP4RE4PeaJ09WmqEeEseS5H59vOf7+JMVA
	SJnqpMiHIMkWmtcZgbDCGXqDaPWecL0EatAN/mTMYsots9sgigTZxQulJuWC9VLMBlWQTUVJV6z+3
	0hulXfAe3J9DPH6KjQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdsB-0000000F53a-1k7W;
	Sun, 01 Nov 2026 22:17:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdrh-0000000F0Xu-3Hh3;
	Sun, 01 Nov 2026 22:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oih8i0WIyQznYHZo2vL+7dttn3r29EGnZfW+AikIH9c=; b=pBxPxn5nRbIjhCTk7PI7SrOmJu
	Ylf9GViTlBEPjuBEOaX0EInTxAW0Wv7HF0sVeRO8u4+ncCOm32vxLsUTy4DcL6PKMBgZ5JqymDISt
	h0hXNPaQIFDUWKUgwpXX/DP7lufM+EATMu010sf0oJ10ry6wUZw6hLXDlC0V5x97+nWjJcjsFXNUF
	TQ8c0gm+aGhMC73ON4aVBJfTFUzEf60B0k6F1HMbHL7a9ZSW57iz4L3oqXy04Vn5TrSJidDHrwDRY
	jnKCU1mJsx8qGlZc5ZHtu+dRjEukt3vb4tLKJBbYHbRFtL0EPNDTQ+GN9aoQTMVDBIzJlt+gqu15R
	kGxOJPlA==;
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
	Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Alexey Charkov <alchark@gmail.com>,
	Amin Gattout <amin.gattout@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Coia Prant <coiaprant@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=E5=AE=89=E5=AE=B9?= <HystericalDragons@proton.me>
Subject: Re: [PATCH v2 0/2] arm64: dts: rockchip: Add ArmSoM Sige7s support
Date: Sun,  1 Nov 2026 23:16:34 +0100
Message-ID: <179357139346.4108484.5874650464024401479.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029082541.469999-1-liujianfeng1994@gmail.com>
References: <20261029082541.469999-1-liujianfeng1994@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141725_929140_D3EE93B5 
X-CRM114-Status: GOOD (  10.41  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu, 29 Oct 2026 16:25:19 +0800, Jianfeng Liu wrote:
> Add support for the ArmSoM Sige7s, an RK3588S-based single-board computer.
> ArmSoM confirmed that it purchased the CoolPi 4B hardware design and made
> no hardware modifications for the Sige7s.
> 
> Keep a distinct model and compatible so Linux identifies the board under
> its marketed name, including when a kernel-provided DTB replaces the
> firmware-provided DTB. Retain coolpi,pi-4b as a fallback compatible.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: rockchip: Add ArmSoM Sige7s
      commit: 3a1d774014392d4f5f83ed73c2237b3c4a9f525a
[2/2] arm64: dts: rockchip: Add ArmSoM Sige7s board
      commit: 718ce9703d90c061e2574d11b8e5e8a50c089243

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

