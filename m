Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD9E60A260C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ITW8BRy6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MKP9owv7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=; b=ITW8BRy6vLhroh
	gYjRE6jp77FUoKjyZa8pMrACykrA3141y5Sco9aC3tebG4KoqGFT3EQNKlNFwi/1CX0B9e8VTuhk6
	rauuQNwUKD9r5bEis9l11iO8VnEM6A0mUvK35+x0hHDOsljNBySMahUbaIm9ROdKOSlASIacnWIfK
	8VchSv5wqHStyFS4OcqtABU2nIHJ5O0nSbhW+AaThGhyA6R2l1StFbYxs66/j1lSzfkW4QPTZig1s
	DkDXXMuJTlM1on3DK+fOnGQbOvTeCwzEyn9JZJFxmg72nFPkjaqvgujXo7B8E391s1nGzEVwtR496
	nmtcf2e4VkR9lAxsFzWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wP-0000000FbE8-1eJI;
	Fri, 23 Oct 2026 06:39:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wL-0000000FbC5-2w8D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:39:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48e00eee27dso280740f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737584; x=1793342384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=MKP9owv7ke1/0oueZNs19f5Q3d95P+i95+x5xtA+DVXlFkx+3EhhPd7pjK3kxjrtld
         wFdKxCTvr2cDQcYue/YhzR38MJUQJ8HZGSjU5AlJf1npgMGJ8Q40gpU4EA5MAH/bUsLD
         1zISxvAHyJ2W0EY7/zIOij8mDnCHrh9ra8cFUJv+xwzF1pIpU5a/9/qI/rWrKKmYLiXS
         H2+5RJBXtL7gMYcr7nsJoK1/Yz2oKuGN3VBKLDrhQpmRhvgQrHs1cCVS7S5PfkFHo5Hs
         ooU6uQqNdkw14bBwrNya2MEgweuNh/vOorG6zeCaJBUguDWThTJNfPH0e/3XmtcQVjq3
         HKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737584; x=1793342384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zCs0TMoU/xtdfW2o//Qc3w2kO9KE9uGMF0SrdJknZZc=;
        b=pnMjf15Va2EaquWhydKkhO0CTA2K7MAgG6yJpc6uO4XFStCpGpPe/sknhdGTZxEJR/
         z4s84tfEdJikeKnX/3FKr31PPiTbGJUjFffQ8PuALKDXJ/0pRNhwMfsymSY/+3z3yvP+
         I8y3qT6K0IZfr47EIEq4siTEthSF7Py7B2ZgUFuirACvejkBc+2E7nK3tehWE2ZfxrHl
         fu6Qmf5z/T7RX7O5OVTkQEkQJHb7UXy0+yZdDifAZyZo/M8kCEXgxYcIIOPeVSfZrPSo
         clnr7s0ecCN6WqHSB6lOSTwjrdJtiHxl0+XhEZBunVsHwlmbVHKokudxKViPc3j71/sn
         RivQ==
X-Gm-Message-State: AFq9FYIvLXLuLadCIB0tgdvidlaGonxT+55ANOF8CJxHDpf5zf1b0aMR
	rMtJ3zVL8+WF0FZoM6mWb54RdGEJZIR8+aAQA+0ka9QQ/EHlR+q0nrlY
X-Gm-Gg: AYBFou2F6GTKCL9F8AJAZ6ViDfxFRTuq6zOV7rAcaBnJOC0O4UOkRONhTAfMQRaffoE
	3AXkdUU0eV+ycUQkjWeJNQ8Swbq8Ulr9T9yK07N1dgYAztCWys9Kqj9EDrnGthvMZMw9F38gZJM
	hcINifixwE+taOQrtZpfxobuLn11RGo/vD8vap2TY3L0nR5I7Ot4NAf0vCF+op7awd2cB6v4CJO
	MdmYGRwq9ie5S8kLpAk7Qihs+SlaZ1tl8LeEe8xb/xgSpzaAebYatEIE4ItJKEYiiznVyU4PwPT
	j6VKdEcHw5OTjfHREEdgAkOQoLcp6vbprpLsBGPdr7QbS9rWo965lGWxKw5LT7D78ZKaiSCbjn6
	D0Lx/s72lDjYeItcUSAAyyGmCdHSISZ3JZvqsp01YSS+kiZjN24HJk2um1s1scjpIzBCsxiOaQF
	JVMxEAI6Xd9ffOYVQ1HjIVrdEMvEAuy0BTAn1xdXYRo6FCxpU6pBG8GFsTkFnhO3j5zQZ7JMZ+m
	qAxNhCw8gm7ENfQtHlHSCJ8ULS5RehoZTlELk8JZh3K2DO3TsuEat0UNVURPgxgkr+GWcB+au6A
	TjExIPyFumKX6I+Mf5CATPrYY5HjxAeE5Sfbc0iREaP/ni2Fw3vgYw4+gc4zBYScnU8PO7nbpbo
	kwhU=
X-Received: by 2002:a05:6000:15d9:b0:48d:ff0d:cfa5 with SMTP id ffacd0b85a97d-48e385b9322mr977703f8f.47.1792737583628;
        Thu, 22 Oct 2026 23:39:43 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:39:42 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:27 +0200
Subject: [PATCH v3 02/16] dt-bindings: remoteproc: k3-dsp: Allow a second
 sub-mailbox
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-2-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233945_778378_AF414E79 
X-CRM114-Status: GOOD (  15.93  )
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

Allow specifying a second sub-mailbox that could be used by the firmware
in addition to the first one, which is taken by remoteproc.

This is required by firmware that doesn't use rpmsg for their
communication with the Linux kernel.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v3:
- Initial version
---
 .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml        | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
index 278b88b7f906..d6319c8e96f8 100644
--- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
@@ -51,10 +51,12 @@ properties:
 
   mboxes:
     description: |
-      OMAP Mailbox specifier denoting the sub-mailbox, to be used for
-      communication with the remote processor. This property should match
-      with the sub-mailbox node used in the firmware image.
-    maxItems: 1
+      OMAP Mailbox specifiers denoting the sub-mailboxes allotted to
+      communication with the remote processor. The first is the one the
+      remoteproc core uses and should match the sub-mailbox node used in the
+      firmware image. The second is optional.
+    minItems: 1
+    maxItems: 2
 
   memory-region:
     minItems: 2

-- 
2.54.0


