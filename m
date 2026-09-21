Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A11C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oCrcI7igLaQUil9vBYjywYIs9hdqlrNEBSUMKWJIUV4=; b=F7NWRNBzFcfEe53XGH1jsEhkso
	CYL+DpeUargj2kt6agUGBS2uKIIHyP6WzhQ7FtP05ESTW9qk01pXEP6lyad21pbiT8kF6A5g7LOhZ
	swHJIQLyIcD86HtEpUJuI+dFOUsif62AQI+k8YohtoP5dbyKHPZEmkM7WRJQVqejIDrUL8WLFhB+j
	p1dsWVItLBa6PGTZrlrFOphT+J7zNN5nTfoDlDRWjRpMSWm3tCh7T3DfmWiZXfVUaptqdXN3qAPEw
	tgk5fftVpEIPQ5FZ12avfvJ1zDuDCc5zBkXwowtN0u0dJSS2qZl6btTDvkx9uUd6ufbRS/wrwHLcD
	iLyWQQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bmT-00000001ocP-1PV0;
	Mon, 21 Sep 2026 11:01:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8blr-00000001oLk-2SrH
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oCrcI7igLaQUil9vBYjywYIs9hdqlrNEBSUMKWJIUV4=; b=NeT4Y6pE1wMpTOhRCeWh9WhuQF
	pR/5N7Gmo+FZAI963xOBJ3GAnj+7/M662npDhM40vCLR9wRr/78c5RYNUUcbOEf6TGby/9Ts+mU5f
	xGi7lM9j4gEjqWJ9Bmxmen/Ag1uVL59kud5s0ERily8X8+5K0gz6PCHoj8vUilYYn+paYUw8DJhev
	xd4cRepsr4UDO1bIuJ2k7cfbjEWoPll3Dju4tNj392UMbUFVwNF4Mc1SJHaLIBsTSoTxU59FiQ5A/
	pR/fB64S00XzxBJKv5aFqyF+dlWPMqFNVDYPM+xhniFVlCN27oM+PeBobtUCeq1H8VM74rtJNlb/i
	bpWuBRPQ==;
Received: from mail-wr1-x445.google.com ([2a00:1450:4864:20::445])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8blj-0000000CA3O-3Fud
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:01:10 +0000
Received: by mail-wr1-x445.google.com with SMTP id ffacd0b85a97d-487057d8a3eso351326f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789988466; x=1790593266; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oCrcI7igLaQUil9vBYjywYIs9hdqlrNEBSUMKWJIUV4=;
        b=MgSiyOgNPo0W7g2LnQbTYzE6urvrMfg7xTGvAvsVKpJRrtfB8SVc7bo3/6OprFJlc9
         89cM6EBI483iLo8iwyxKdCEqLOy7Etni15zR3SQVCIwMKpWUEe2PH8/R53rW51bKasvg
         XEEovwvDy8CrowZXqDzE9cw4toFkM7fFNczhOntpwkmZ09QpnWGRA46tPG23U5vtH6eg
         ZT20Okgvk5OEGidMS7j0BbcEulJW+xQNqb/vrt3swtaOqW5xy7EQwfCFnF9fLMmTq14e
         3NJVypYZFwl/gB1Dl10TtGg9y1PJOuCQaDw3pzd/mQE5bQh9Gcc7g8i6NUDiajlxF1mg
         BsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988466; x=1790593266;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCrcI7igLaQUil9vBYjywYIs9hdqlrNEBSUMKWJIUV4=;
        b=jKtmGFiMOqEjxnBiHUiwpxew1NrBXqUgsgCzy7V5r6ZGoFFHdIxywYYV9OWeXGd/Lv
         rqv3UCOP2rQbi9HDTN608NtPf3wx3dG/N55fs1HJZdWjBwUBqOe/+Am0lfQBtMoNn+1q
         88bCT6CiADRgBBcUgLggCveEjNRnpRMh4iFgFlTMGsywan2ZwpTdnyW/Zs+Ur6f7oWXL
         rFm5WnRD9iPXgqW9Wx3ss3c0pMh+/g8Kjzr1ctoJLP9WSAU35adPuDzAouL8RDFbHIv+
         Pgl1Fuu8yS+3NPpHkzhxFxh05u/8mf29Wdr9jLISwQzMBUyZ8SXcLmkbh/fkp/Fsm6E3
         F3uA==
X-Forwarded-Encrypted: i=1; AKwUvByOcsR7kjttzjtSUnHYrOhz7uOFJv6xjvcwtWmYigSbGgfvLnk3rdG07B4v3w8HVByJUkjFrtOoYGVmPoshWz1C@lists.infradead.org
X-Gm-Message-State: AFuF++lxy6oIEMQt1S7ElukdU6W+JK9KgK6yZJKo6fejeMlAj+iVr0fS
	g/ZO7VP3Iq+5ug7eaLPwxHs94t93cRHOYYhQ5RCxgX4a0A5mvqdPDnN3VbB/uGNAjP9ZqNKQkcR
	p0pCoi8Bwgpmt3bYlX6hZRg==
X-Received: from wrbeh15.prod.google.com ([2002:a05:6000:410f:b0:487:2514:733])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:290d:b0:487:27f9:829 with SMTP id ffacd0b85a97d-48727f90a8cmr8269596f8f.30.1789988465393;
 Mon, 21 Sep 2026 04:01:05 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:00:50 +0100
In-Reply-To: <20260921110050.3977591-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260921110050.3977591-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921110050.3977591-9-vdonnefort@google.com>
Subject: [PATCH v2 8/8] dt-bindings: firmware: optee: Add memory-region property
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_120108_059928_31B89FE9 
X-CRM114-Status: UNSURE (   9.36  )
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

Allow reserved-memory via memory-region to support the arm,ffa-lend-pool.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 .../devicetree/bindings/arm/firmware/linaro,optee-tz.yaml    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
index 26ebcf4565f3..7fddea9cfdbc 100644
--- a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
+++ b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
@@ -41,6 +41,11 @@ properties:
       HVC #0, register assignments
       register assignments are specified in drivers/tee/optee/optee_smc.h
 
+  memory-region:
+    maxItems: 1
+    description: |
+      Phandle to a reserved-memory node for the OP-TEE lend pool.
+
 required:
   - compatible
   - method
-- 
2.55.0.1082.g2b9226bbc0-goog


