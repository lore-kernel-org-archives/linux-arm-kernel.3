Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225BFC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 05:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d46airT75vHv8EXQAD6iB9DXsZw0o96cfAedDj25Jsg=; b=BqB1CcIpyzN5K6c5KepWrnxuC9
	JETPqDV7wgts/gIXMsmzEM+7Fz0MhUN2RApwdQYZDx8/zGzcfIOkEzBH3mTk5s/sAgeR+puc7uTPa
	rt6SNXPLpZrzjd9hKCRH9Rk8pJH6+4FraZwcxOihQRGtFnFACNAAX1e0OmMOrvUj/ohaAV8w1fMZL
	0d7iXMuAzhIcllNyRAmr3k2fZOcP+04Up0noHffX2uhooDk6MgEupte7rrGqYcBTe1mCciXBUQ8aT
	H3hUVU3fIr9/x5pKn45xYooZCE6UfyCjoiRUqFTtVmndIOtG3wlmhlYD4SEn82lLoJ81eTlE1+f9k
	thnSTTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2k9a-00000009Fap-3507;
	Thu, 10 Apr 2025 05:08:42 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2k7l-00000009FSx-1r12
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 05:06:50 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-7369ce5d323so294925b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 22:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744261609; x=1744866409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d46airT75vHv8EXQAD6iB9DXsZw0o96cfAedDj25Jsg=;
        b=Lt/zo4rqU6v/8HpNPh/p6Pk206VkxtHG3o7WhW9KBa4QR8P316cICXZLhLirA0Xwzc
         8iPt0FvH3pCo/VSQDdjwykVjSlCYPCFaVRVTxiVfsJHxF2yMCkaw2k9n+x3R3cmJQpWs
         LjkDPz0iFS/CN18fmi+OeOtHEp3MThCpPPEKRJnVlTbcBCHzWL7ITYUvY6JaD1Zfgtlp
         BAae27cMcrulHqb/SN38a2R3w0nbgOvhNWLxPUWO+63T/NC9Z6XP2M67tVw8YmRkupIi
         tqs5aVPurOBHKSV+tVqQBYV7jgYyeM3/jjNrD+kfjDRxkcfdkdLq5MbyqNIfEBfQhXAJ
         WEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744261609; x=1744866409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d46airT75vHv8EXQAD6iB9DXsZw0o96cfAedDj25Jsg=;
        b=xGafXCIXA3lwiEMSvMNL5KHYqsUburp+ilvYRmfW0l1KwS/ZuEuIdqGxHvisAbfWA1
         CRXWrFJtYJyJ73Ji7jleqtFWWjK3j1OL5jiM/zFeYklpKIaMl1f482thajWaWvI05+7G
         BIO5QQkcXEI77LizGcdZ7aTYK5380KHDF8HdMBZ/orLeDnLPwwD6Nd1Tsv+OsSyZkN0D
         m4TwKOuNmxb0L9geUXDoi3x/KtNiezF7LM1H80tSwR099R+4AcPtXNkT4+3zw000Dn1y
         8GxV+S6Cvv618cfGAlqHcZHlVLDV0yjlrL8K4zlQLhg9igQBX9mlhU0Of1vWRcik2WCw
         cNnw==
X-Forwarded-Encrypted: i=1; AJvYcCUJkzTf5e6X5R7z6zrHnWpWNDZeCbZPw+6duGL3F4ImNHrRjOMGcrDpLC728AcsLb3oRUJcVAqSaTpHzt/PKdN1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy33jJgXGNNqfDe+M5rOK0JqiU1z4Ckp7pxIGa82GKPWcCGi0VB
	LKg37Gm01w0hE94aAazSRyOmAk8PiMeDACqs+arG/mzA//1XVBeG5Fsb9OsrY8o=
X-Gm-Gg: ASbGnctfFaeCLmf3/3n7fHHz/TGvwR5nmr/fkpkrYDvjkvPhD4ElY0Ev1SXCvuhKdqD
	SVyY0RTeEzDijCylTl0bajdlaQ770F4bQYDos3S/oNj7auYYbmlR/JYb43Va1Y2Z80o0QHpbcF0
	y03rQM5q6EK/xepJRByJUUZL8jp4/0e73zyTQ1XMxZFzHvTjU0J9t3GiASo498tcH6M9kYkWRep
	lizvs5q3lYAptSkvFczOURfka787Mfa8uMjxwvP50G/orvU6cEm6MS8s2kV0YYQwbboJg3p+E1N
	eJRP+0QfypQpg1GX+hEbxn8ewXnk5gyJiQ29oXn8muUDwOMFyObLSQXXN6Az
X-Google-Smtp-Source: AGHT+IEyf/jfRZocce8XbsHKUc43T+JyTF/Sk4rwsW7yZtcHMwpngitvkGrHYV2zaS4TA5tWyxiyjA==
X-Received: by 2002:a05:6a00:1310:b0:735:d89c:4b9f with SMTP id d2e1a72fcca58-73bc08129b6mr1309744b3a.0.1744261608589;
        Wed, 09 Apr 2025 22:06:48 -0700 (PDT)
Received: from sid-Inspiron-15-3525.. ([106.222.231.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d6af12sm2320503b3a.80.2025.04.09.22.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 22:06:48 -0700 (PDT)
From: Siddarth G <siddarthsgml@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Siddarth G <siddarthsgml@gmail.com>
Subject: [PATCH v2] media: imx: Fix NULL pointer dereference
Date: Thu, 10 Apr 2025 10:35:43 +0530
Message-ID: <20250410050543.6963-1-siddarthsgml@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_220649_520894_78EB8236 
X-CRM114-Status: GOOD (  10.76  )
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

Cppcheck warnings:

drivers/staging/media/imx/imx-media-fim.c:79:6:
error: Null pointer dereference: fi [ctunullpointer]
  if (fi->denominator == 0) {

drivers/staging/media/imx/imx-media-csi.c:795:27:
note: Calling function imx_media_fim_set_stream, 2nd argument is null
  imx_media_fim_set_stream(priv->fim, NULL, false);

drivers/staging/media/imx/imx-media-fim.c:388:3:
note: Calling function update_fim_nominal, 2nd argument is null
  update_fim_nominal(fim, fi);

drivers/staging/media/imx/imx-media-fim.c:79:6:
note: Dereferencing argument fi that is null
  if (fi->denominator == 0) {

To fix the issue, add a check to validate that the 'fi' is not
null before accessing its members.

Signed-off-by: Siddarth G <siddarthsgml@gmail.com>
---
Changes since v1:
- added "media:" prefix in subject

 drivers/staging/media/imx/imx-media-fim.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
index ccbc0371fba2..25f79d0f87b9 100644
--- a/drivers/staging/media/imx/imx-media-fim.c
+++ b/drivers/staging/media/imx/imx-media-fim.c
@@ -76,6 +76,9 @@ static bool icap_enabled(struct imx_media_fim *fim)
 static void update_fim_nominal(struct imx_media_fim *fim,
 			       const struct v4l2_fract *fi)
 {
+	if (!fi)
+		return;
+
 	if (fi->denominator == 0) {
 		dev_dbg(fim->sd->dev, "no frame interval, FIM disabled\n");
 		fim->enabled = false;
-- 
2.43.0


