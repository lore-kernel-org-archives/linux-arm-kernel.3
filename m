Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF390606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s6I9QFvB;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cNkUGCpY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=; b=s6I9QFvBt1AAUi
	SPMbsCuNi7LsYuOE7Ses6c0VpXfRFNq+PXYXu2j6DeRhP/WqEhgsR0m+vYD4QG+UOcXQM8fJ3UaOH
	N913nOPYZ6ti2DAaNuJqQV358bWmFhy4KA8BIuzvYFvnYrKFWYCsErIVj/xdLJ/1vzvGH1YFEWOAA
	p2kHqkpw4mCJgLdo/iop/PuS7Cd8maHx+O/NTLDSQmH9XmjyhzMHagxC4nRkqrh6I8r30rtuxQHq5
	dM8V5a38pxQGD8QjzcMyWw4Oeb2IjbEj9VcBCVvX9/iAihn+3FC5UJ5s2MORkgwq54dvpj2ZJmCiL
	TEwRogszY1l2Rgsx29Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhTR-0000000B3QC-2iA0;
	Fri, 30 Oct 2026 07:56:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhTN-0000000B3P6-3pBC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 07:56:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso3154985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 00:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793346983; x=1793951783; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=;
        b=cNkUGCpYfH3cMnPpumrj28J2kecDzr/BqQCHzfTPJzpbsYm4jLzlwzk6WcWjsoOuaN
         OheuapF7AcZ3l+OUWk+JNRGx6tT/Lvx/PCM6yGEA99hWE3QEKTRk4VLT8VWlDOD0zIYO
         jzu29PZp4Gm0ZAqcbbOvxfDWzoPXJEnSOBsKyYmSpOqZ6NUTB9cfLqdQ61pGFBkxr7nO
         o3YTEc+6/EQSqAsAkon8MFrQaoTKViP5XS3uWuF/2ofMMmvBJq7lXAFZC60QbCUiGyUT
         uulbbg/lSHoFr4Ie9h6vZTStfpl/B//JMmfC7zgqyZAL3ofBYMDvHpq9zR/SpznUjcYj
         d3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346983; x=1793951783;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dJssWm5QoOE15zN0DOMTDlBMnhnXDibO0tKV4NrqOI=;
        b=DUPHCX6wiJ4iMm7EozipfQJcF9CwnCglK1LyJvrLiTenQ+K08AXVffaC04+jEf6lXE
         Yv5a/PL/USEsVr2YDGt7BmJbJkLRXc3/kj5qgBu/RMXPwMR3AtEwLrc+c8yv4cflj3LR
         PwDeSLPvr8actg4HoEBkapCCZsfF5g/7fnlQC9o/eDjYGhSCXOLuqzYxPUuJWheMd/lO
         UXdIOszc4PtUnlP2DeTIbVC7pjL/xUV7iz6xK6L9/+RK+9KamfL4B/N0+B0960Jle91b
         hZzWY06qdFJOXSVDR7VZlmDdClySja0JSbQFWCacDSItzTMMgBRABK2/fmAvArl147ZJ
         beWg==
X-Forwarded-Encrypted: i=1; AKwUvBypQ6rhwjVGu1SyrBM2yq4OKnpZnNzyCg48hGpYNqxLENL6B3GqExUa4oPNEWMroMal+zbT4N7CkakG9gfLYfme@lists.infradead.org
X-Gm-Message-State: AFq9FYKAgyaGt/vKHsIbfQmHTxFSdDxvL3zyKfCr0hr6QstNucl3pB4v
	eUAzvBWo5yoALdE7H4mjzyV5kJvfA6nasiDx52pzhhOBdV/FjdK6yqA3SXCq8MSYnRrwPNkGSUX
	u01nYGcw=
X-Gm-Gg: AYBFou3wXbWJbtcvKcAe0DE72On3hmb1IhB9R5ab+DxzIrdMq3Wr6R6kxEe7sAyDP/J
	97VXnlWUHupJEcQHVSXUJK/jc1LmlXEcVAkMZ2Azi2IZuBoQAdz1sPH/gXgZz92qcXGliAN2gKC
	N9LkcPRIMCQFvUnn6bjrC9GolPr+NcZ+QHXGVq9uoqJv5qB0+bPH6oiSEL1NdebBsRjTfCiBvQi
	MxWStkva3dg2/0t+1xK4fvCqF4SB2ghSCs64jqgXPYMTFDCmFFLWi0+/acPSLQ14goVihSDNL4a
	dflruuv2n2szIRmQMdWzOwppH5g8GpWg/sK8y2CYhe0iX50Pf8GpueZjLITANQex5U97sYY0iZF
	RkKFk9ksi5t/i0izYC9GbRBDTKZIGL6zabNVZ9eMJJXzJadREsmDeDumSsMFhqw8TH3bKqOAqLt
	w8aBkOUjmaVHmDN/F/pOZdOa7b7GpLpK8f+N7P8Owt9Om5Vwx17wsDATZCkHxhlW0P530dCT6vH
	CrtulRUN1n8y5qpcUfQ/25csR4lkK60BOr6FtritWbGC4QfL0hddJs0YoJcTFWvbqqtBvv0JRgC
	1WzKoxPTUNi6EJFyphOEadtLe4apy4fgw1BprX7CBOv5bPLw
X-Received: by 2002:a05:600c:848c:b0:4a1:d087:f6ab with SMTP id 5b1f17b1804b1-4ac17d19e0amr27983065e9.18.1793346983717;
        Fri, 30 Oct 2026 00:56:23 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm1896842f8f.12.2026.10.30.00.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:56:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/3] Fix the ENCP clock select field on GXBB, G12A
 and S4
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
Date: Fri, 30 Oct 2026 08:56:08 +0100
Message-Id: <179334696866.1865333.15281691536960205924.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=349; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yU+vJw6/Y9vZBqgM9DPcf9eaGw98kAzxSGCAE0ufIe4=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlPfOfdXWhmxJXoz+huw7YuS2jSZs/mnjdOR+V//eqXk
 NnIeGhiRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZScZGR4bWVSPUD9laR6frZ
 +yeFNLw65Poo+IMTx407XyyU+JwF+Bj+qbpdOeOS4l3KXKDVuEz8ShR7lmvmhLvGi0rOPhJ0uve
 dBwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_005626_042001_82DEB4E9 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 19:37:33 +0100, Carlo Caione <ccaione@baylibre.com> wrote:
> Fix the ENCP clock select field on GXBB, G12A and S4
> 
> The GXBB, G12A and S4 clock drivers place the ENCP clock select at
> VID_CLK_DIV[23:20] instead of [27:24]. Fix it in the three drivers.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


