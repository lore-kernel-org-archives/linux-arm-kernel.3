Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C799606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v0LSAfnk;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mi9BKT0A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gccHhk1zXKvI2lBwqqMmtzgSCLGdxT+o/5IMCODfY24=; b=v0LSAfnk19NTI6
	3ViYsm6QSyzqNG/8B+BQ/V+rCDe19hgI9WuxnhztXyk76ns8mQiLrImgBkvJdwauFF5yAzabpWXIZ
	gofhm0gO7EGfGhBgnwof9SbNVbVjPjvO2fnnoSUSI25EAtTsqQbgYofldi4ZLWPXLhry1ej5NNT05
	7ZAC560KFuzzL4D5YgxUU1lfF2+OVq86zC/E1a72Y0FwICWbJGYsdc8lTut5RLRruRQMWn79DwGfu
	oK99zqvcdlXWE4qNQkFekal6orUvj4WvofA6yOtIiTQjZxBrYtox2SVNWtR6jcJj2jkQDFkYBXp1g
	F5iKdRjTJMhK1lBAgBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA5c-0000000FoWP-3zrY;
	Fri, 23 Oct 2026 07:53:24 +0000
Received: from mail-dl2-x07.google.com ([2607:f8b0:4864:38::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKA5U-0000000FoN5-3wkZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:53:18 +0000
Received: by mail-dl2-x07.google.com with SMTP id a92af1059eb24-13985f8229aso501946c88.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792741996; x=1793346796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gccHhk1zXKvI2lBwqqMmtzgSCLGdxT+o/5IMCODfY24=;
        b=mi9BKT0ApkvsihwKCECbPFdyO9H/xgaysN8nihLyPQ3eqZ3xjvi87dQiDbxG/Vn9oh
         ovnBQkxkYfM4zNRdj184pfBpzWLDxy1PrxQ52QmvyL00EV5fHhljoLXKPwK9rgtt7DNv
         0ik5UEwC0+Le6NMX9n6fxdfq+0ORrGlngbkKFaCYJp/iA66c+EvSnWK/rL0Hb/e+XnFe
         eOFZN9h6RKvvINBQokRjiSrOqY02IwxdXCrUb3gJ8Dfbb69+U8j7PMAt9Py5bDYR4+J1
         2K0skys2tSslNa3pOeax5g90rlWCDSKpfCN6ND81Ej4Tz/V1N465v4Hi8XLhYj5wF56G
         a0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741996; x=1793346796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gccHhk1zXKvI2lBwqqMmtzgSCLGdxT+o/5IMCODfY24=;
        b=EIHE3F2/gtRYXo+EPI9Ntu7e0W4kg8dtG7snXqxwOiHUS2e6JCU2LRZTAsAVUn1Hvc
         0gvCjN5U7/feu3j+SmQQC/FPe7hvlrw6xJQP4ujvhNaQS08Z/GGQEmIaTsVW978n9gX/
         9UwZw3GzrEWkGI+M2ecAm9Y5kU+4ai4cbt0zgy9Jc6T1UFlht3GkKEyDJvG7i8PCt0DO
         AVG3rNTo6FV2Gk7S2RA2CQyyYhCX6ekqTGAoY6qqMtdPVFsSoK+D00I3Sz3qA1iCjNsP
         WPI+HIIXsrF/M7OcaHtIhDhgyAGPm023jmOXyi2hip/Xr5vjn4i25pcvv6ZVZh6pbkGk
         1HTg==
X-Forwarded-Encrypted: i=1; AKwUvBy9wrKGoI8HIsVSwV9v4IvSLFFVWEy/X21dD5BUpXHhEL6aUzk0DQk9XW8KYj0l6YU61CbpjvOZ0DjUKr06uldH@lists.infradead.org
X-Gm-Message-State: AFq9FYL6Hr65Dx7aZa8YyMmgekMuTnPnndkyk5vVSKaouRN/yNur0UUu
	28JOb+237lWhpxwKUwuUsyt6xt4GJye6rR32fDfFJ8ntsMiS0GE8Cc3v
X-Gm-Gg: AYBFou3ew+B4cFGMLgFS+/I1q+JwHZHgHqQ+pvUwrfPtiwP8UQDyhoCwK+ZwLXdjA+E
	bTqeQPxz/IE75ubEtDQIwYIGsAOAEdk096LcpFXUNPHrqqEfxIaBjbhgKviOtBDMw1jNNOLmvvn
	jUOVkJtBjXdxO+6v5iEBvbBdt0U/xMfjOqmWlr47Id5rCNAcoZxXhbqMhZyIeJQHpazsvFDwbMv
	HA9ZBababvZpwY24kaNF9T5e69mAnUcmBjomRXeMgfAbTP1dq7ECaNYpgZcRgoNAj2AXLH+NeNJ
	nkPMcfS1WqrEcWGEFgnW0rs9C7m+iPS3lZaW5F+VlvIEbTmsekHT0PS34a7ObctRlaIeH7f5EDf
	3yjYAVy3WaQUNNkaC7vK6TxRWuFBhvt5hrGBfD7cOUrgkFZ7JX32Cqh6pOn+Ma9ltHNKFJsWqBs
	OEVK/sywxfKuuXU9bF/GHaMTar9BawYKDLt8EPfiXW9A5A2X+11qfL91qLpgH2vcrQ1LsoPB/GW
	gUwklnDEEsDO60Wvl/6TgtdTuY/WwK27g21pXGsohpcI+hpmQkMbQ==
X-Received: by 2002:a05:7022:e803:b0:165:4b88:abc2 with SMTP id a92af1059eb24-195c1e5520fmr2349281c88.26.1792741995686;
        Fri, 23 Oct 2026 00:53:15 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eae0e830sm4122132c88.10.2026.10.23.00.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:53:15 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Coia Prant <coiaprant@gmail.com>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 4/4] MAINTAINERS: list DW XPCS platform driver and binding under XPCS entry
Date: Fri, 23 Oct 2026 15:52:15 +0800
Message-ID: <20261023075214.1793922-6-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023075214.1793922-2-coiaprant@gmail.com>
References: <20261023075214.1793922-2-coiaprant@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_005316_995163_A587F442 
X-CRM114-Status: GOOD (  10.22  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Synopsys DW XPCS entry covers pcs-xpcs.c, pcs-xpcs.h and the public
header, but not pcs-xpcs-plat.c or its DT binding. pcs-xpcs-plat.c only
matches the ETHERNET PHY LIBRARY entry today, and the binding is only
matched by the generic DT and networking rules.

Add both files so the entry covers the whole driver.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7336600952c8..4f24656f7653 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26729,6 +26729,8 @@ F:	drivers/net/ethernet/synopsys/
 SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
 L:	netdev@vger.kernel.org
 S:	Orphan
+F:	Documentation/devicetree/bindings/net/pcs/snps,dw-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-plat.c
 F:	drivers/net/pcs/pcs-xpcs.c
 F:	drivers/net/pcs/pcs-xpcs.h
 F:	include/linux/pcs/pcs-xpcs.h
-- 
2.47.3


