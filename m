Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B821FC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2aWiKsurNBx2CqD2IBEMy0PrGzIHEYiSv8/glhDUeo=; b=q/95VfI3H4OD2eSFDAyDManDNg
	TDRW+gY7fCLE2cciczen68iVqvWtFyKNS8IMMW1VjDxn5tZzESjLcxJeqv+EclS4uQb68bZj6+J1B
	O6N3ngUwTPapJfeuKDqqtAk3TzRNSb4FLjJZyTGnBakB0IuaEb3jiKX1m3BYScE4SI4lBQvxsvNxG
	JhCbuTT04cR6lFtw9+aP0l9wZOg45430yuZM6y7I2IJ0kFu4/awETeexaI7zC11Tv84wQ/3mbAjPy
	zhxnm22GJi9rFctttoHYKj5SJZO5D84JQU+FZ1AwJOKpOuftbfQb/Iz+3MzrcoGFYmS2pvnt4NNIq
	OSsMTHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46K9-0000000AW1M-2T82;
	Wed, 09 Sep 2026 00:38:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46K8-0000000AVyo-06DR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 00:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=l2aWiKsurNBx2CqD2IBEMy0PrGzIHEYiSv8/glhDUeo=; b=iVhd4/mIJqDeNpmw19g2BJ+q0c
	wLBvg+EF6dBrQcSiVxLunb9in8Md8tg6mMfKh8Z6/qeEqZ2NtzLM5pnTJAlq54UYTDe5qzES7X/nN
	RCn7qH5OgZJXs58rhjehtegRQBts+EwnRIKmtJHn60bTXcuKv9uRWgv82ndVggRlT3Le7dhA/LDHx
	An7qi2GkI+kzYGRLPrVvAnpP9dOXPZuAQd587yGdVgKW1SUAaD5jjIXi+8VczZNwKmRdirrFUZpib
	BN+E0GpTKvpNYcU57KzsbhylJs6skD2/nT4uaSyLnHSkzWJBCeBMCy72u9bLR5Wdw0aEbhGe6DVjG
	q6GlpF4Q==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x46Jg-00000000YK5-3siQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:37:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2d6e954afbdso34519825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 17:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914250; x=1789519050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2aWiKsurNBx2CqD2IBEMy0PrGzIHEYiSv8/glhDUeo=;
        b=s4B3N5POEYJkMACr6Uf06Va4kdekFjSpobw1G430aQfxClbBZ5S6E6w/Z3YBsd63r+
         GZlBP0maRJSzbzT19kAWybPNpNHS3J5JnHK4DzybCZKmgI1OQokXK7tdxc/XIOsW4dhb
         iAv+hTrWeIiECNBy7lAD9Gx54lq7uUxg8zDGWea1y8o00WmJwkxWL2Z0636vZUyyiYzB
         peXQq/ouHnPKAmzpLGPMcGlwhferBOMM7fFTRLB+r2RYRwBbpruE4AVV7Z36VB6UjUHb
         A8m+npFKPF91DPZNR4LCu4p4ueXTHROvfjjCSMcFYtq0pgzY8G6ElmU54/UNE3SdgRX4
         MQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914250; x=1789519050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2aWiKsurNBx2CqD2IBEMy0PrGzIHEYiSv8/glhDUeo=;
        b=ZgBTvqYKGRqOUkQobIiE6jGz5UL8Kq3dQv6h/aLdum5q3o2RsjqP+qoevsDBdAXTLM
         j+lTMYNCLNfBHfcXUSkjRQZsleqUjxr1RGKdxtPSOojfQOa/xbkqQ2wWihSjAwVZ0Rj/
         AQKgdVmmRG770q0DPbFJvDO3Thl+eud/yfBP7DufdFqeCQTtEZUyZr9vBxpAwNcpYELs
         6TowYdRe7tGStVduN/2o1EgG4jbXH07gAYAOlJNIrur7XEIi3hmNe/ZEqoviZP9VKufY
         l+TwwU2p51UcUbZB4bIJxUmx69MqrobceAHBHwL+9GEMPRnHv4z+SmScQf57UwYPHr/f
         /Uag==
X-Forwarded-Encrypted: i=1; AKwUvBxORqcJy7aGH7vz3ZcNYgXLzM9HFbnjnUkQcEvy6xzfZTDqQYMq7aaYckwnsGykNn5xB5nSayjxrls+9Ck1YOfQ@lists.infradead.org
X-Gm-Message-State: AFuF++ntL36iMjrmgd4mmpkkU9L1gJAtoeCyfgev+6RerU7gtwJOWvbu
	1EQMIVJd2xtqe89lhu1qWSSDaw7cliML2YT69bVQevOi4gXzUEA4YNH5
X-Gm-Gg: AYBFou0rs405k/rU5bGP2NfrvYzB1oWmEan1iRDx53yq/6PQK4gDEfSKdsuGg7ys506
	t18oYmNVUQWAfVpTjITyyvHdGQ9cqNwKOwS356nJsumrWOKAg3UuXeULltNWMwA+9/ga7jyjLmg
	bmnf9pzxfAs/qOY5Y8dI9tAIr7m2D5MVJ24GVYpK5gdohQrvagzvue2wlCCDCOMmUJilqlAcYC7
	wP54Tukpkx4bhG0541CmbdQFrXxXol6xnFq4/8Zmcj0VVHZAhUluwJePjR0uPxEJs1PdtKJAXD1
	FvnpnwZ7DI48GFGx3ckAGK+dOUcL9oxS2RIfu0m5T9FguDea0C3h/XuW3w5SyHuBmTzUXXzDQ9D
	UIQ8DuzMC9SUZjqCrd9/gntwgnVwTwgxIUvJoqrMfOmkCQSWdmvhqi0F1QwTk8rdZ6rQp2Uk2uE
	4vPeviErgQjqqKpnAii/n0ZSZAfH+pSq7BhRE7ouAtvcaSzvzewIW4EGO1Vwvp
X-Received: by 2002:a17:902:da8e:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2db124c35f8mr434654835ad.7.1788914250063;
        Tue, 08 Sep 2026 17:37:30 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db2c0f1daasm51431225ad.5.2026.09.08.17.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:29 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 7/9] crash_dump: Check the function return codes in restore_dm_crypt_keys_to_thread_keyring
Date: Wed,  9 Sep 2026 08:36:49 +0800
Message-ID: <20260909003657.1570544-8-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_013736_865766_DECB5922 
X-CRM114-Status: GOOD (  16.27  )
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

We should check the return codes so we can abort if keyring allocation
or reading old memory fails.

Note there is no need to refer a key add_key_to_keyring, so delete
related code.

Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index b8fe630462cf..bc70fbb79e0f 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -66,7 +66,7 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
 			      key_ref_t keyring_ref)
 {
 	key_ref_t key_ref;
-	int r;
+	int r = 0;
 
 	/* create or update the requested key and add it to the target keyring */
 	key_ref = key_create_or_update(keyring_ref, "user", dm_key->key_desc,
@@ -74,8 +74,6 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
 				       KEY_USR_ALL, KEY_ALLOC_IN_QUOTA);
 
 	if (!IS_ERR(key_ref)) {
-		r = key_ref_to_ptr(key_ref)->serial;
-		key_ref_put(key_ref);
 		pr_debug("Success adding key %s\n", dm_key->key_desc);
 	} else {
 		r = PTR_ERR(key_ref);
@@ -134,9 +132,14 @@ static int restore_dm_crypt_keys_to_thread_keyring(void)
 	}
 
 	addr = dm_crypt_keys_addr;
-	dm_crypt_keys_read((char *)&key_count, sizeof(key_count), &addr);
+	ret = dm_crypt_keys_read((char *)&key_count, sizeof(key_count), &addr);
+	if (ret < 0) {
+		pr_err("Failed to read the number of dm-crypt keys\n");
+		goto out;
+	}
+
 	if (key_count > KEY_NUM_MAX) {
-		pr_warn("Failed to read the number of dm-crypt keys\n");
+		pr_warn("Read %u dm-crypt keys (max=%u)\n", key_count, KEY_NUM_MAX);
 		ret = -1;
 		goto out;
 	}
@@ -151,12 +154,18 @@ static int restore_dm_crypt_keys_to_thread_keyring(void)
 		goto out;
 	}
 
-	dm_crypt_keys_read((char *)keys_header, keys_header_size, &addr);
+	ret = dm_crypt_keys_read((char *)keys_header, keys_header_size, &addr);
+	if (ret < 0) {
+		pr_err("Failed to read dm-crypt keys\n");
+		goto out;
+	}
 
 	for (int i = 0; i < keys_header->total_keys; i++) {
 		key = &keys_header->keys[i];
 		pr_debug("Get key (size=%u)\n", key->key_size);
-		add_key_to_keyring(key, keyring_ref);
+		ret = add_key_to_keyring(key, keyring_ref);
+		if (ret)
+			break;
 	}
 
 out:
-- 
2.55.0


