Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5551C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 01:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=; b=YOeECVgna/YPHfzZisCcHwK773
	L7M6xHTri+kWA0r8aZt7OmmUnJ26bMmx0wVtaOLGLfoXHm5VcX+LDOYElJuaoxxCI0hT8gUJhwqpJ
	NCBTu7K7Bse9t2XEh4EYviomF5zI1HPriMsXoDfWdNKLc65V2qfT4J//BZams1k4M/Go1RI+v/OU8
	b6Xrec+LHO3rXH0vx8GA7zrFD53uu/sO7XAcHuXaiBnvD79q8ZTSlejywq57hXeXHsT8uULy3+YnL
	Tt/M4F0g8sFIOFk73LESmfCrMrtsWMrzEsY/ifEPkL//kyJ3zBP4ZPXzlD/ENnahh3XwFVnqP++lk
	P/RM18jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMmL-0000000Cpsg-0bcY;
	Fri, 07 Mar 2025 01:45:33 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMKr-0000000CmLB-3gmm;
	Fri, 07 Mar 2025 01:17:11 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6e41e17645dso12137776d6.2;
        Thu, 06 Mar 2025 17:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741310229; x=1741915029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=;
        b=HKchh17Kx+B837QNlAVKOGlq/Jhz9An3pWiXE98kA/uU9kkRip6UBPjFhLBivyP8bs
         OGGNtgmoO+QU25eayM2dG+3LqDsfzccLu3pe/bRzwn2eiq+Gxg3cUmCmkf8zwR4nZLEG
         FdcrKIEOsfiJ2PuBYlCj8H1eotMKovw0D1mdTNaTzxvQeTVPa+JbzIdhxbnuD5XmHOoa
         Gt1LfAqGldmOl38H/e35bs6JmFwzjBaVhRnaQaBiK2y+1szXbhwv09yXpexP0ESNZTQl
         N2eRo3/DxVSORpCJ3tei3BSZ80vBl8sguDFpfMJjOl3dG5Tx51HWp6lCIz32ZvOXt48L
         QRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741310229; x=1741915029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nls7kmdirsxklQsEsdMD6n3p+K9nTnYY1CAEZgsVHU=;
        b=r8PLkRyqpTtCFSgsG0Tfmp+1TFxeM95fttr4XDL6c7hqiVIyMSlAy5PrkenmzOCGIL
         IQ+4Va9CpmBKqHFYP5BjEdR7SGIKIGXt689mX1bCmN+/v0z7s0VSCxdoOvuEs2xwziug
         zKiWUnjxMauLnRPsGf4WRRhxrjJL8mEmzArDtfi2v89HEjMrvTI+TWyap6bYhcFbiopx
         pqzpzo4mKFlRAyKxZD4BlHigGhQBhl8UqQqJhgV+Hw/SmDVupifjSOp+lVYXUKt0xTIK
         EeXuagvjBf6crqQUmnZw4DxLg/4LxVdnWz2ouZctrMLnUZhzMCw648JjMi0D9Sn/CoZp
         CXPg==
X-Forwarded-Encrypted: i=1; AJvYcCUnc5zjbyowfW6fMgHjURv7R3ojSvRlC2RCo2W3RUOhukmzCbQXzinHYFQZvggYmm5C+E7ZwjymtBR+BVVDjHuE@lists.infradead.org, AJvYcCXvjlhE8IBtGT9vgN3FKE8EdZMRYJLI7xzt3PLDaCSmwpZoVOa9Hh9aqhuGuGGyPvapwuudSZ7HiICWVkw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHrk8z+jvNfltN9F0WGuqQi+q7iohgK7+gKu7qdldPKNxBeOj+
	vttrABmVMcP1+4xamT4IO777QWYdpkyuM7KAoF1udElMPdqdjLVn
X-Gm-Gg: ASbGncuVLeCJQ+RcaeEaszcmydRp0WcRoxH5Q+Fz80PVCsT82rCNTTDx/XVLgOFqBYs
	pH8uMqZnYiyBFZoYbNeBaV+dgJh5ei4FEFyvEs9BW3kP0hHbB8oEQBK/aOgEync0xLt8LaJ70uX
	i3dIF+E8USqntpOj0mSaOYQNyEWX3i5sO+WgMNfRHYfMlD9EMePtBrLN4Ut94iokRTzWMJHhb+u
	ijN0iXGandnfnSvbH1LNnGLTnvBOeUgqJf54L6ONW3uREP5k6zlO4uLUDRyJNhVJYpXPRAl+2n9
	zJV6GQDi0BEW4K7uidl3
X-Google-Smtp-Source: AGHT+IEnrSWy5fjmLrRLRXpT+vxP0RMfjP0l1E+1UYAsKLj6QeQ3FFyDDhycz4+StwMi79ZnygBHvA==
X-Received: by 2002:a05:6214:2428:b0:6e6:698f:cb00 with SMTP id 6a1803df08f44-6e9006942bamr20372866d6.42.1741310228685;
        Thu, 06 Mar 2025 17:17:08 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e8fa5cff36sm10687056d6.68.2025.03.06.17.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:17:08 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Vladimir Oltean <olteanv@gmail.com>,
	Furong Xu <0x1207@gmail.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH net-next v7 3/4] net: stmmac: platform: Add snps,dwmac-5.30a IP compatible string
Date: Fri,  7 Mar 2025 09:16:16 +0800
Message-ID: <20250307011623.440792-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307011623.440792-1-inochiama@gmail.com>
References: <20250307011623.440792-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_171709_909736_B12EB441 
X-CRM114-Status: UNSURE (   8.84  )
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

Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 4a3fe44b780d..8dc3bd6946c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -412,6 +412,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-4.20a",
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
+	"snps,dwmac-5.30a",
 	NULL
 };
 
-- 
2.48.1


