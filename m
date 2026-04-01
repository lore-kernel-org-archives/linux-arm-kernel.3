Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5723AD35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dCt0i8MZg5wAzl1+V++7RTyCQCjxurtL7p1kb7bfrdY=; b=adrWo7UWQYZt7m2MUwnm1y408e
	NlCP+2FiFaqtr+RhZhz+8c0YdQl+Y6pKC3YsZzBXRU4GfrUTYaHd0npnrFWxldaI1it/T1MbvWVez
	BFwaWzGgksE53enOvYP/vU1lQq71BmilvbN05EbzyFI8qmWVjGYDiBu8vhU6ekFmxN5wE4F8NJvRS
	dMgVku86t4iB2pg1n/J9rpo3y9sNXwKrR3TSF9YHL3bbtLno2LwrkT1TjH0OyEJt9bLmWjNEmsdVj
	KtGdtLXIH89bKW9LtydVWOdcpbwl85oFbKJLuVcpjpak26E9ILnH2Dx4ZVtQ3ULNMwFL2uvkI8Usb
	zW0L31Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tZy-0000000EcWb-3sBw;
	Wed, 01 Apr 2026 11:17:46 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tZv-0000000EcVn-3u5K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:17:45 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-66c73f6be2cso1458467a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 04:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775042261; x=1775647061; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dCt0i8MZg5wAzl1+V++7RTyCQCjxurtL7p1kb7bfrdY=;
        b=F4z63BIi/s10hkow1oCd/XtOnK94if/VqmrQeVRc2X95CKljO9RxhrDxMokcVz2cWX
         e0zNMbn0hNfarWDGdNlINr+c25PWgOgeKtJI/23XACLNzVsEhYl0YZFx8460gW7oQxUR
         ZjUKMj3lt30af/wIQeyI0j6GemBrOkkhCkhhNLmni5uHPDW9sEyOoI1ybsHdjtIaaqK7
         CerFBfTzLoT+J++quDIb0EOHx2CnexEe/3mtut2SNGPNyQVfvxke/AS4GiZDF+uz2YD+
         ENNiso/mO/jU+aImeUDgKq1BqnZkeJDAfx+czcUBcANw+On4mDiMUSjqvq/0Bnrn+MMJ
         hz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042261; x=1775647061;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dCt0i8MZg5wAzl1+V++7RTyCQCjxurtL7p1kb7bfrdY=;
        b=KyuulOgij9wndLBhEDNl8bqPtXd4xGk7TMV1Qx7Oycldrs1/CN++WLgXWisebYKpbG
         ThdHdzUqOV+yjRLuOrsE3egLXJIq/VQuOvuID5nuaXt2y0HTpUb51t4VfUKcmWxLgLcS
         iSMr8+nXAffwdMVz6Mzxunz2i1nHjStK8ctXdojOtLWBdEp6TsUyIppwx6kDoGuSS6K/
         /XLjrVW2JUTT4FaB7ieYkMNLZtS7eSUeru0xuqElvg57Ly0mmCoerArH4d4tLCp7OrnR
         fiD8bTSi/ppt8X+isRka3LDYEWhDNO7GMn41cKOOGwxAfcdt3AW9LL1+iG8fDZXZwaRK
         qvFg==
X-Gm-Message-State: AOJu0YyUQD7wfwwniCLVTP0nMw2Pl5gm7fluqxGsQscBTmZ2F192QazL
	YZysm3pUy07LIp8b4n+WA/1xd/mJlW0Dhzy4+YkGxRXQyyxGcUnmNUc559UTUnal78MzCo3O9+J
	kmtS4tbWliNkQ2CK/8eVFF3HQnVjEZYZFEJIPwM/CWygH/uOsDXgSzqbZ6+r5GFnpo0mpL8seCX
	97smGXo+yJ81ASQnRQN59muooF4ITNC8mLg8ybBUAE/2sG3lv9lT3JQiulUACbhTFpDVK4CJ/ix
	ZhfGFi238au8oc=
X-Received: from edaa2.prod.google.com ([2002:a05:6402:24c2:b0:66b:b7d3:7cf1])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:288:b0:66d:ce0a:25a2 with SMTP id 4fb4d7f45d1cf-66dce0a2766mr1492419a12.14.1775042260930;
 Wed, 01 Apr 2026 04:17:40 -0700 (PDT)
Date: Wed,  1 Apr 2026 11:17:38 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.1185.g05d4b7b318-goog
Message-ID: <20260401111738.323647-1-sebastianene@google.com>
Subject: [PATCH] firmware: arm_ffa: Use the correct buffer size during RXTX_MAP
From: Sebastian Ene <sebastianene@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: sudeep.holla@kernel.org, Sebastian Ene <sebastianene@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_041744_031585_B833ACFA 
X-CRM114-Status: GOOD (  12.86  )
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

Don't use the discovered buffer size from an FFA_FEATURES call directly
since we can run on a system that has the PAGE_SIZE larger than the
returned size which makes the alloc_pages_exact for the buffer to be
rounded up.

Fixes: 61824feae5c0 ("firmware: arm_ffa: Fetch the Rx/Tx buffer size using ffa_features()")
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index f2f94d4d533e..d0c926aca120 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -2078,7 +2078,7 @@ static int __init ffa_init(void)
 
 	ret = ffa_rxtx_map(virt_to_phys(drv_info->tx_buffer),
 			   virt_to_phys(drv_info->rx_buffer),
-			   rxtx_bufsz / FFA_PAGE_SIZE);
+			   DIV_ROUND_UP(rxtx_bufsz, PAGE_SIZE) / FFA_PAGE_SIZE);
 	if (ret) {
 		pr_err("failed to register FFA RxTx buffers\n");
 		goto free_pages;
-- 
2.53.0.1185.g05d4b7b318-goog


