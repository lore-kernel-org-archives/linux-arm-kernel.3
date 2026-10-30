Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84500606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 16:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DFwwvYSL;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gvSSRc3O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=; b=DFwwvYSL8iCMoE
	3b/Oo/xxqx27WQ95aukD7u9a4hnAsYw7oTI+BSlHCD4AGAyZcpl9GPacip4jgva3wg8ByvH4e+t65
	bQB9wX3Fk8/o/mGOAURUQ/9vpfuTHfocoGOaKSKERA0/1Di/NH4trSjTlqsvGQ2+NBfca/ztR+ls2
	fvCESPrEdts4S6kJ/KJIKkhAd9ce2uIy0iqbM/h79FIoxcoBR+/5WIBslMDSmZjhKsC/YoXGHGQaj
	glBOC4pBqCLZLfY5O3346Vg3H/ZM/UQu6VjvutcMEbwAwNIhVc+vtTh2MgW4T+hHbpEc89x0NxD7i
	agVPmaEwTsC9qm04Y/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp0E-0000000C3Rf-0ZsZ;
	Fri, 30 Oct 2026 15:58:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMp05-0000000C3L7-3WwZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:58:43 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso9191235e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375920; x=1793980720; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
        b=gvSSRc3OWjUfb4HtelRkTqK4KvM8ccEsOq+3R252CWGTU/UtPR+kCwdI3EzY5nFj09
         3TRNDSCmKVedmQd/0RRYg0kGPxYGqHezdTeOgeMCglWVIE7OUgTLuVAS3wpBg2r1rrxY
         Em1SGM8XlZOvRXA2tzAdwPpM1+X1jfD/Cuy/0JcHhuoz9+WXO0JDiX018MY2ylzjTg2/
         Xq4eDScW3ELHDzrOUtGJDfEGMTV9PBj1gdXDuyo7ClRT3CUhU/8Vpgy/xS+9wdP65VZj
         ZabULnkCWuFwbQNlH3plAaiqHCTZTthUBI/kzGpXJbqDKFMN8FvDDqlDUPTL8aIz+ATT
         InOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375920; x=1793980720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVKdou+VgdxrxuNukuzV2dd7tDlo47ujCjTpwTY+LWY=;
        b=SCj7zsjc7KfkIuzMG47vu4aO3z367Kkvo4Z2NLSVcGvkf3VWp7/ASc/89FwQFCl54R
         UYyFcqjOD5cVwJWq8m1TPe78y3PuE9En3LSU36qj04lF1mey39KHHP0waQDXD3MQs/aM
         XkgVC3ceq2CznlsUozxwp8tfHbxcTAATvBvRupL3VJI+f3jXIQWcoSuvkDRF7LtunoRr
         6wBPpaQu3hj+cGsUkIYh/C+Yp3kc2hg0wNE0VPnoOFsX523rZ1gRohtmgoU7VudrcNg3
         OJFsCwkmqypuwz3BLKrI2vjeFXKhp39cmbR8jUQtiYwbTglqlGaJavtYEUnb8gbZiwor
         it8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxSk/NEYby58A8dGnC+8yqDGo7p8cs0XybSY2IkwXX3YMIGaoTvqgo+YAXdm5xwq+nbTf9C0HASgCWGFl4ZrjmR@lists.infradead.org
X-Gm-Message-State: AFq9FYKg1Q/oIdgZsA2GsFY1n3dtQV1yJneuISP/Xafq1miugNPONsAJ
	041HEru35ygwwgMLeIPZVO76izOglCf3rQUOdhTUHN3oOpeXFMZ6Qi3NjcH9LiFII3A=
X-Gm-Gg: AYBFou16xjtpYiZ2E9ud2kZYqYGjAwZ/Lc7VfVmBiWuJFcy4aDyB/GmsHAi4Rq5fgou
	L/Z2gKC6Rn2c9SRDkTdr02dKQfmtAV/maD3lkMtcf09ZTqSNNaVjaPe+/N2sv99LHUvEMZzQ04D
	J/O7u/HnE8jggQekTRJMSAmwfMOlwDHjs8hmIzcY7sO0TQiqaXL0oHKHF3iDgWq7EX4ux2ryqoZ
	ZYu1J2W8dtnbMJYwjjeHy8Brneqpm0dyiqfhuwRHS+f45XBfByQtSX/myilheFvB7xZuTDPOA+x
	FKj+D/HueUHLV1qqKpJeSvYGaC4rxDKzVwkaARgbVPHX8rml7mvI5o0Z4FxSZZQbuB87k7JBQ70
	O0SG/xRVQ+5fgruIkv5/zU/vGE3SXXu3YZtb0m7Rz3qb0KXXqurWTabMU80lMtmeVy9ci+8uR2i
	AqzZUrIOBMW5zZdye3ERtS4NuPZ8byHlFShRjFTmMRl7clVAkDgtnhd85gkPIZQ0df6rpTA3+N0
	+tbur7iIK8D5NQUKPycHNxBfaWirQ7Ofjnm1WCESCrgF7fEixkv+3oFRNATFtqvj6MroiP9yp65
	zK4/vZSdyOMZBb8RqSsDFsfFKkH1QkkN8pXH8IJNklD6rSyalY8=
X-Received: by 2002:a05:600c:46ce:b0:4a1:f625:2108 with SMTP id 5b1f17b1804b1-4ac18a88820mr62818445e9.33.1793375920100;
        Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba53d7sm5738054f8f.53.2026.10.30.08.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:36 +0100
Subject: [PATCH 05/11] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-5-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_085841_902710_718C07DD 
X-CRM114-Status: GOOD (  12.70  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Use only the identifiers
that were copied and ask again for the others.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 42cb1aef1fe1..69645ce73d9d 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -261,10 +261,22 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
 					   const void *response, void *priv)
 {
 	const struct scmi_resp_pinctrl_list_assoc *r = response;
+	unsigned int nr_fit = 0;
 
 	st->num_returned = RETURNED(r->flags);
 	st->num_remaining = REMAINING(r->flags);
 
+	if (st->rx_len > sizeof(*r))
+		nr_fit = (st->rx_len - sizeof(*r)) / sizeof(r->array[0]);
+
+	if (st->num_returned > nr_fit) {
+		if (!nr_fit)
+			return -EPROTO;
+
+		st->num_remaining += st->num_returned - nr_fit;
+		st->num_returned = nr_fit;
+	}
+
 	return 0;
 }
 

-- 
2.56.0


