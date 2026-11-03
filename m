Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F4E606A326
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 04:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l9++IdEl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWUzPqiD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wLXXZycCt3p1k/CBuHJtwLDAq2dYHgMI6sCWUancyIk=; b=l9++IdElx3JtPp
	Oh/OmJQWS5gA61LsoMGUZU0bFvHPzFZ3yUVlbySI75+DpSrSopn/iScbNfFc5vfuIEytXjDSazl+V
	UOgDMdUQcVD1Gfc9BO7oXkdiJvOOZu8jbUbQgXMsLGXgl5Tag5TnSJcS3oYfMcgloWSZGHmUr19tJ
	AsuAXszkVKHwDpFXtPza2ZT9jLRDAAwB/du+rs34jdOHckz8DhhRevA0MmMgsbhUbLbcZTSQpieeJ
	Dd+Low/pCjNm8h98MMd7tpd0MJfo6/a+ErWryHsv3+/watJlKMDwfQBsejMPkaFPrCh3IemGuwErF
	A8h2hjTIeWDDEEhTks+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6Qd-000000014rA-08Wx;
	Tue, 03 Nov 2026 04:47:23 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6QZ-000000014oC-0TAi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 04:47:20 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-15943c9c005so2315852c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 20:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793681238; x=1794286038; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLXXZycCt3p1k/CBuHJtwLDAq2dYHgMI6sCWUancyIk=;
        b=uWUzPqiDhlJ52W9QRFeVQMf2rMKv9v/9mPcXeJ0BXAcMyrQgA/nKOfLP28GvazTRDp
         CfXSIRFVb4vgfreFIw1+1hEWp//EKqXlhHwjzLbG251r218oE19g7PzWiVNaPemU6iDf
         zu5KfnIivp1VfrM1Kcyjy1eoodOlCpC3zSw72RI/U38hA28UElrgXA7pMOIUvGu8TRm0
         1AzxR5VNLEUABJy9DpjEKFGtlsGTiiFPkGznEzHIXh3BN6F3VUP5X5ySDJst8lKDU2Tk
         BDDVWuqvtd+AUQsG3gTroTZZKAm8rILY/QWMfACtnKTrHWZg8cSFOgO33M+AKRBXRSLg
         Vqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681238; x=1794286038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLXXZycCt3p1k/CBuHJtwLDAq2dYHgMI6sCWUancyIk=;
        b=jjJXy1puGHNLBrpO+o8UlRammOyWERIva0fIPaEXlIHz0wY5JRNCQNmneNIkNB3lRP
         r0R9S5goWWQwa5QQAob0IjvOhMqvwz5ZFfbmDsURLVtzNTADpPL2UxM+3zb7QBJmB2/S
         Bw6HPcMMa5jqZgcrW36rdAn062OpYi6/36yGmQsd2cSeXpxfzC/ZAuPta9WVrzL2Ox45
         i3mydw6CQCt3USJPr+OLbLHfFTSrOIOvVgsMdKUPcYRePeG5gpjtUMp8qAcEnHpPve4K
         qDvIWAoQ4Hp5O5MdfcblBBizJzVywAlyHrby/EO0iDBrc4HOlB3HE0ZdJ1wcUTFkolZ4
         Jryg==
X-Forwarded-Encrypted: i=1; AKwUvBwV7CHxY3kjYwvg1u4V7ehJUIjteoTRlQh70vTlgnpYSuAf3946kQ0cViiph7X55YXfzlBZvrVeDOxHh7ncCVj+@lists.infradead.org
X-Gm-Message-State: AFq9FYKMSdKsFHMPBoJvZWIOIS7TkakCjNGnOHxvZlkeJvuY5cnrkq3I
	TdVLolR+H3jB5eHm3a3tiMnjtjKVdODkmDY0UknnNRtlpm1yj2g1CmPS
X-Gm-Gg: AYBFou3HehrfNfqyrapxeKtimR8f841zTYv2okezhkmFkvMxIGos07ajC1LaeVeqiB8
	O/oqaRB/MrhnHtnj4AxVi8LW8u50WlAOLQ1V77+HlJrqsTiQAjWrqU3yUXfucCJrH1icfWx/3rI
	lQzhRtKYgpdpIXGYWRjR1lGRXfoP+fDZ+IdQfgM8LZD99zV85UrNLe0r1e1f4Z+HgBVPnCVCBjm
	CGmH8+PByPfKnCxe2N8ODRmAvmEP+xJ4etBNhnGiE6Y/vRzExB8MzDB+RxX5Uktfg0MvKOZKuU5
	X+CjboqvqTHRSEDVYVNAXF94qeXD7sCnlJn53Mqb0O5ibiIH3yMKPbdEv3dV5kTPUqX+tA+XPBr
	aV0UvCbkNy4Y6nEdJ7QnT5eP5YLc2xWRNzoHD7YytwlGlSaO8cWmhd0d8iLj99BycGOfmIqV2Ig
	pRu0g0vW3HgWAQf9gFkaXkYN6wwd3uDJ+t+AiInge1TzDKvmlofNRDJuAjprvTEh085QcrYx12o
	Gi8tJqI9BRuKckhbo9+Xeo27XRkDGQK66+7Lh7gL4x3M8kmnP+i25OKTRxSLA1cVJX517acSJxw
	3prVi05xiERGrY4NaZAuKmrtY0Z3YQexBtQJq5T7RGd1MtbHA9FSRl/8pMJazDjTfizN4uWwNG8
	APGDoWLBmfK4hfNEE
X-Received: by 2002:a05:701b:4208:10b0:1a3:116:848a with SMTP id a92af1059eb24-1ac5de5424dmr17866007c88.35.1793681237912;
        Mon, 02 Nov 2026 20:47:17 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:98f:6bcd:858b:7a64])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm48385807eec.11.2026.11.02.20.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:47:17 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Val Packett <val@packett.cool>,
	Hendrik Noack <hendrik-noack@gmx.de>,
	Ferass El Hafidi <funderscore@postmarketos.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] Input: goodix-berlin - set default resolution before parsing properties
Date: Mon,  2 Nov 2026 20:47:06 -0800
Message-ID: <20261103044708.2461481-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
References: <20261103044708.2461481-1-dmitry.torokhov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_204719_172844_44A9E1AA 
X-CRM114-Status: GOOD (  13.77  )
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

goodix_berlin_input_dev_config() currently configures the default
10 units/mm resolution on ABS_MT_POSITION_X and ABS_MT_POSITION_Y after
calling touchscreen_parse_properties(). This unconditionally overwrites
any axis resolution calculated by touchscreen_parse_properties() from
touchscreen-x-mm and touchscreen-y-mm device properties.

Set the default resolution before calling touchscreen_parse_properties()
so the default resolution remains in place when physical dimensions are
not specified, while allowing touchscreen-x-mm and touchscreen-y-mm to
override it when present.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/goodix_berlin_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
index b0938a4f3fec..5cf453427eeb 100644
--- a/drivers/input/touchscreen/goodix_berlin_core.c
+++ b/drivers/input/touchscreen/goodix_berlin_core.c
@@ -626,8 +626,6 @@ static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
 			     0, SZ_64K - 1, 0, 0);
 	input_set_abs_params(cd->input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
 
-	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
-
 	/*
 	 * The resolution of these touchscreens is about 10 units/mm, the actual
 	 * resolution does not matter much since we set INPUT_PROP_DIRECT.
@@ -636,6 +634,8 @@ static int goodix_berlin_input_dev_config(struct goodix_berlin_core *cd,
 	input_abs_set_res(cd->input_dev, ABS_MT_POSITION_X, 10);
 	input_abs_set_res(cd->input_dev, ABS_MT_POSITION_Y, 10);
 
+	touchscreen_parse_properties(cd->input_dev, true, &cd->props);
+
 	error = input_mt_init_slots(cd->input_dev, GOODIX_BERLIN_MAX_TOUCH,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error)
-- 
2.56.0.385.gac671c819a-goog


