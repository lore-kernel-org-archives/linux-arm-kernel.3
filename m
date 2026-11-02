Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0006606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mCa30Tn7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kTibpMUs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=h4Pf0yuMbG7VmbL6qh5TPaycUsxMKNE4IhWYVqEHmlg=; b=mCa30Tn7doQCmENuW/wWW/IPDn
	8Iw8uK+vXHBZCOfwdveNo/0N8yt9013JPSrtX7llxGdqRwEbL164aDU69hg1l3OPBDWUOM4UrBWQ+
	1ZX+nrayIc1S3XUYuoPL9rLqrkJcgB3WzjniAMtTB9o7p3Jvd+mgiiAyTaaO96bkM3cystt7iSRR8
	QynqEJcyCSiK/nctsiwegB/saMg7CuNd1ChYJtq14ZaZHHBlaXK6fcpN1J0Nu3zUacd0YyYFEyGN0
	S8gHw6AzMUIsSfOwD8S6ozRxtP7Z9Rer59EVxIqbcHnomCOobxrh+6ViMKpPzNobyI+r534Hkpwqz
	ccZTF6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzWt-00000000T8V-0Pf0;
	Mon, 02 Nov 2026 21:25:23 +0000
Received: from mail-dl2-x08.google.com ([2607:f8b0:4864:38::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzWp-00000000T7F-4BMa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:25:22 +0000
Received: by mail-dl2-x08.google.com with SMTP id a92af1059eb24-1379d236149so1383814c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 13:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793654719; x=1794259519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h4Pf0yuMbG7VmbL6qh5TPaycUsxMKNE4IhWYVqEHmlg=;
        b=kTibpMUsV6/u5QBv1XHD4D85HemWR5g9QA4z8kswotmjLTss5PVhpwGK05PORDXJLp
         QsT+AZy3lTi2Yn+ClCbbZTz2A0O9OldP+SO7jIAJT0Mkco0ZyJVZOxD9bPXk4XtcpNeH
         gRMC6024YEjr3WZi4APYWhfvavaw4et6M/ueZejV2XKXK3WTZLNtjO1cnAEWFfqlDobk
         TdICgSS7V9Wk/O9U+Zo3OE45hUQ2hfP3ygsXSzSY/3rDnmMQQtiRxwRAZVVG7PKuukDS
         q8VM+kBQLA5pk9rmXZYf06PqoLQu6LB9AKl5IYzEbR49o4RZ/K8HS+F6ANcTguAsVlaw
         TQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793654719; x=1794259519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h4Pf0yuMbG7VmbL6qh5TPaycUsxMKNE4IhWYVqEHmlg=;
        b=Sb2N3tieBZ8no6Eqbc30uIVidX3YZcsMuxB2BrGCKfhf3UVgABhHmvwSG8O0+AxcDI
         G4Uy9B82OVrMyC6HiqNpssr7kFm++KdlT3D1USbEfXqnXXwrpf0v+iQOhBoF3DJ3+/qf
         u40RcJrRWJdh/tPA0JzxYjESYPStywWGVv1h5Ne8JAW+hCNavtIUBQIApZp+Nob1mfys
         t4QhhO7++pztBnhKqjORcHHeuddUnX2EXVplqVB83WiTf3lEZYLhgDdB1qOEGvdodfXf
         uxJcRlaLVv67J15csFvcpK+1OYW3GJanneAPfaOqaHloPXJXAkSMaqgrdwdJYPfGvpX7
         B84w==
X-Forwarded-Encrypted: i=1; AKwUvBwF50UiRHdyxe6qYIkh3yrapi1nQgOgHGm4KpVwx/Cw1SPWTIo16Lb2JsOFljp8SoGTiPTEz5vjAFEJFtLNp4w8@lists.infradead.org
X-Gm-Message-State: AFq9FYL/72JAlyLshb0XVx4p4+BFioFc0QB4KBTBadvGdMVTE+vYQUQr
	IGu23W+XceizN+zdlfrBpTlMFgf6SgVeul+o0/uOXSZlsFGoe2NN+dJ5
X-Gm-Gg: AYBFou0nvP+FBHL3zZmSHLz6avDVD8m3JHNrzHkVn4ExdHwqzFE/p5oC87lybqlwKmI
	YutyyvUdmHwK2CJNaxIfN14TUojmlwvaKCbTj5wotMoNV/8TleDQLYYPw7FzGUY4iYO8ZCYldog
	nAiqbiS04RvXCJd7FZF7XXew1rOhHN38UnSNIdVvsfulsBP+ywo8SxkbEiNa8GyyLsU9MN2eY91
	fCnc/NQIbxwNTsBmUxHEUiewFhwEMIaZ4i4XrTGTG8sVcbVX6ihVxFtBMuLBktctsZ079xNOwoN
	0ssHy+zSW047dzpV2+tDWL89pV7JnUVpbnS6ZErm7oRDLRI0XoiGf2jhOvByunb6HJZHjqarqw6
	AbRlie1V4BaXOZH2IHg6vbOjOeDVv3TS9DEOeR8VHLH9zQp0MaL+Z68j/XlPGN9o1nDk1wSsaRz
	LlnNq6QaKQrEtKO0ObrAiDDI1lSOuxownMzSAOsOJXhS84gOyqHTiUTkui1zrEXvKhDl7WuujP8
	JXycKBYyB4y89hWHi6iUM77dYmOWq4eb/DSRL9OHyxLmL4EVIjMKa3lyZZGJirDP9FJXtq9N+Hh
	5/io1N79BuySn9+M8yry1Nzcntk=
X-Received: by 2002:a05:7022:3f04:b0:19f:527d:96da with SMTP id a92af1059eb24-1ac5da7b145mr16079436c88.33.1793654718619;
        Mon, 02 Nov 2026 13:25:18 -0800 (PST)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm37195851eec.12.2026.11.02.13.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:25:17 -0800 (PST)
From: Coia Prant <coiaprant@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH net v3 0/2] net: phy: fix PHY interface mask initialization and XPCS usage
Date: Tue,  3 Nov 2026 05:25:04 +0800
Message-ID: <20261102212506.3348537-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_132520_027515_6BAC923E 
X-CRM114-Status: GOOD (  14.50  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changes since v2:
- Patch 1 (new): move DECLARE_PHY_INTERFACE_MASK_ZERO to core and fix
  the array size calculation.
- Patch 2: advertise 1000BASE-X, SGMII and QSGMII instead of only SGMII.
  Intersect the platform mask with the core mask using
  phy_interface_and().
- Add Fixes tag for the XPCS patch.

===

This series fixes issues related to the handling of the PHY interface mask
(supported_interfaces) at the core level and in the XPCS driver.

Patch 1 fixes a hack in the txgbe driver. The local
DECLARE_PHY_INTERFACE_MASK_ZERO() macro incorrectly used
PHY_INTERFACE_MODE_MAX as the array length. Move it to
include/linux/phy.h and base it on DECLARE_PHY_INTERFACE_MASK() so the
bitmap is correctly sized while still being initialized to zero.

Patch 2 makes the XPCS supported_interfaces mask authoritative. The
generic compat table advertises modes that a specific integration may
not support. The Rockchip glue now builds a platform mask (1000BASE-X,
SGMII, QSGMII) and intersects it with the inherited core mask. In
addition, xpcs_find_compat() now checks supported_interfaces before
looking up the compat table, ensuring the core respects the narrowed
mask.

Note: checkpatch.pl reports "Macros with complex values should be
enclosed in parentheses" for the new macro in Patch 1. This is a known
false positive for declarative macros that expand to variable
declarations; wrapping it would break compilation.
---
Coia Prant (2):
  net: phy: move DECLARE_PHY_INTERFACE_MASK_ZERO to core
  net: pcs: xpcs: make supported_interfaces authoritative

 drivers/net/ethernet/wangxun/txgbe/txgbe_type.h |  3 ---
 drivers/net/pcs/pcs-xpcs-rk.c                   | 10 ++++++++++
 drivers/net/pcs/pcs-xpcs.c                      |  3 +++
 include/linux/phy.h                             |  3 +++
 4 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.47.3


