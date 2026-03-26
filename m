Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3844E109E547
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 04:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4sc9eF22ynlpvOhGIdmpxFtevzPA+moa6iK6YW8bAPE=; b=LvBlBEhn8NPIR8gWhG5/YLpMme
	Xe+ivg4QnQzlYBgfVJ++htWMh25DIFbJWd/OwtV1HNn/Mr/aBb4gQvKMaPW+2uJU7Vit3sGoKVswF
	M05APNFmMEryksG5/6cLMRuhf8CKZfo3ypQdMgqv2ygQ+Hm2O/IJmnnVVlH34ndj7mz29kaaLhZW7
	y/BAzbe2z2eR8jG0YBI6vjV14rFRO1zhusTbXQWMOa3yajLuWqH40OiGC9hL/UzdnyegC/r2CJ6ex
	twwm12J8iHScwSjAW3mWg6NaigiliNHBdQsq3d7zUvC/fo9QHrKJeokE6NVl9SZFygGgI+2AU3LC/
	BctgDirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cGj-00000004fbw-37uO;
	Thu, 26 Mar 2026 04:24:29 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cGg-00000004faG-46OP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 04:24:28 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4fh9dw3n6fz9tq0;
	Thu, 26 Mar 2026 05:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4sc9eF22ynlpvOhGIdmpxFtevzPA+moa6iK6YW8bAPE=;
	b=qHki3Pv8BitXtg7NUbAmF90IP1hF7YVm5J4G/SeiqP2zTiSAuMK3V4UkzID2KnJP3pgLNu
	+drSb80MU98RLKFFRvfpHx1rcEYTlhK7tMLgGhWtgvktpBInAA3fvNA6IYuAkyq0jlsKl2
	uWG88Gtk/8ll2yLTFdc+R/rnKeCc8vVhvhoWy6q3NxGbNQJfzw4tFV2gAEhW/KHWDomOPw
	29t7vBlnPuC/qOqcGX0jaPY9qnhtH+b8U+TQDwEGssqVdWCazzjPVpUkcqzN09KTv4te0F
	pX3FnqMSwBRCBIn/FEVJ7LQqQeu8ERLEasn5Q6bTZWbKSZ9cJNvAaF2eOjy8Zg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=D7rTkzRD;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4sc9eF22ynlpvOhGIdmpxFtevzPA+moa6iK6YW8bAPE=;
	b=D7rTkzRDL+xaid+ZggyHD4wM3GPbaN2RtcQyoyDLM+TUVFVTrlIob9s24gmSVHpMJXRam0
	zHVx22p2whbhMr79eyYRM6Z+rofMIsVtY61+ao2H15jauK6CihpgheabzbRfhVX6CysZdk
	H81S2AgnEAMNw+p2tIgNWZKP/N3HGAlY3i+0fZzTbHsZJiusDbtINZ5yRSLxWvNFJBS63T
	0Pwss1nfbzqzav+zKCcknm5Mf/D4jjyOvsKbLkHqvAGEkBaOOVHSRLm9b0gQ5bLXC9mM7O
	AH9s2JsPHx21VDzgwATOZSjDgKVbqR9JMdsbRo7jhMhJ3TibDQizHNdS4qOzzQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: renesas: Fix missing cells and reg
Date: Thu, 26 Mar 2026 05:23:57 +0100
Message-ID: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5w3gzjnq9qnautburomud1kmpaim1pqx
X-MBO-RS-ID: 1ab4610f542420e0b76
X-Rspamd-Queue-Id: 4fh9dw3n6fz9tq0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_212427_165993_C1A46BDF 
X-CRM114-Status: UNSURE (   7.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software, running on the system "bombadil.infradead.org",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Add missing cells and reg DT property into DTOs to fix warnings
    like this: " arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5:
    Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node
    has a unit name, but no reg or ranges property " 
 
 Content analysis details:   (-2.8 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/, low
                             trust
                             [2001:67c:2050:0:465:0:0:202 listed in]
                             [list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -1.9 BAYES_00               BODY: Bayes spam probability is 0 to 1%
                             [score: 0.0000]
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

Add missing cells and reg DT property into DTOs to fix warnings like this:

"
arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
"

Marek Vasut (4):
  arm64: dts: renesas: Fix missing cells and reg in Draak/Ebisu panel
    DTO
  arm64: dts: renesas: Fix missing cells and reg in Salvator-X panel DTO
  arm64: dts: renesas: rzg2l-smarc: Fix missing cells and reg into CSI2
    subnode
  arm64: dts: renesas: rzg2l-smarc: Fix missing cells and reg into DU
    subnode

 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dtso | 5 +++++
 arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi     | 5 +++++
 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi         | 5 +++++
 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso    | 5 +++++
 4 files changed, 20 insertions(+)

Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.53.0


