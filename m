Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EC1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 17:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PdW3So2c;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=pps01 header.b=jX2FZlFo;
	dkim=pass (2048-bit key, unprotected) header.d=columbia.edu header.i=@columbia.edu header.a=rsa-sha256 header.s=lionmail header.b=hRFo/UGx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kr5/q8OuWKhHjvAmtwtnzB1/Q2cWtMAH+LprFc5Esi8=; b=PdW3So2c2lbN75dUDzihxxq4GW
	aqtvkVKKKgfQluAzYrzFfl6dBxuQux6S7ascpMrUhUz4XWKU/Kx/wpxCQEzGJLv+rHMwLpNRl9kCB
	vp9Ir+RSWCE0ihqlYmz8s+VHwGmU91NUSv78hS6LNEi0LJrVJaGEA0t94NlharMc4jKBrZFxh8PDD
	88MPmZri1NypQIvpEmuP80dpEpLtHyqDRRHa9ATIXneZB5SxHtl6QaOtaJuVZd0TvgMMNcHtKJwBX
	URrO/R+Bbpkf41DsHCQKQz6twCWzevBSmVuHrNXS1I5aFOGABk6kaPPuc1hK8A9r4ftdVN48jg9Yf
	K1/5ZyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNDG0-0000000DXcL-1EEf;
	Sat, 31 Oct 2026 17:52:44 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNDFw-0000000DXZO-0yVB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 17:52:43 +0000
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VDkLTX969340
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:52:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=kr5/q8OuWKhHjvAmtwtnzB1/Q2
	cWtMAH+LprFc5Esi8=; b=jX2FZlFoQ6i2GnZNWF4nLzsyZrPCkNt4TizG+46YfS
	msihij7QNb9+VbrmCP9g7Z/sb99RkIeSUyMR9uh+f52MEf8rbk1DA9WhBrmKL+P4
	pld59e61aAC/svQb17q2nGnEDawOYuOP9pDRJtoweZf3Yh4efYr/W1FTOXg/xTxo
	Ngz5TUoSq5yvCk4zQNZUlRiuNWq0AFj5mmHgjNb/yNu+blgfm9R2gfOQVytb1kwL
	BantX5EiF0LbftYiRpMhxxLF8HZCAs4qavPLFNUD+WWMXTYGR3G5/vAWtaXum7kC
	ph0cz9JeUCcdLkyh84tKdIA0c8jdQc6u5etwZy5RlwfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hn2x2vp2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 13:52:36 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso397511185a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 10:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1793469156; x=1794073956; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kr5/q8OuWKhHjvAmtwtnzB1/Q2cWtMAH+LprFc5Esi8=;
        b=hRFo/UGxU9V5YZHFsJoF9m02iTz2zl2jHkEEcdMLnedl51sgWPYYKstmoDzMjvpi8X
         LEk7fsuJ3mso6wuvS9nkSBAbyefKDz/9Nd4DU85ay2otXjAxfDZVrxoEgNN9Qqocj6gn
         aSwjpEuOoYGqmvnUSdztJnvmS6/l/ptqAiAvMrF/cYiTTZgDjmnqK+PcC/06OIjtQO94
         dKnSub6fQG8Q4fzwLHGFQD21SstJJSLPx2L8XovH2OxpkHGFpjk81s9fQeQBNQSUjyUs
         QGh5uUe4jNe3+QYxlkHqnfs3RnMqwsfxqH3TjbrCfIloUWFrjOyFIn6DzReTnNIz7f47
         ZF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793469156; x=1794073956;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kr5/q8OuWKhHjvAmtwtnzB1/Q2cWtMAH+LprFc5Esi8=;
        b=A0he9xhQczhCPMY7R3aiQle+Ewl2wyWS1j4v/c8GU1Xgb0hluIzaXmeeZ/TgE6Dbkt
         0GTNJuMJscS2lDD77wAzcyIE2/A3TWuHkeNxPv8bef4WQR+YCzJnTR+ax+bOQpM0ta4b
         JGkOy3pWxJ7stPkxPBmyjlVz3ePHv/PdbhaIEp5q9V+Fj57U+1mIwow4ke6MO469RYau
         YJMZK1pRMIPzN3rUAr7dI+2yQPeGaGuOu3Yp9aYSDBf7jPAdN/hXg7DDd9s3IxgWgVU4
         2DT7G10zr7+iYczKHPzLJy5nY1nkAjTxPf2Z87OGZf7tqGKvIHm3gaHk9ty5/Gcz8m/X
         /97Q==
X-Forwarded-Encrypted: i=1; AKwUvBzhp6zZq37F+XDMRoaVMXspdL8LG4tyGX4Y28DZMUYYRGcrmMnpA/wqSPc+8eNrao/N2hQij178ZJQDEvyjQfec@lists.infradead.org
X-Gm-Message-State: AFq9FYJY0dJodp58ggt7sXZMEn8oN/M9MKzGo4Qg1XhmALWHg/6KaYnP
	NGlhiz7PSi5FhygXa93TVVlA9bi0eK6HIh9N05fUx2oB5LCXP5gp0w9YkvZpdP/SVDJFxp9aDm+
	51doRKpzL460pvLR9d/jjkTXiibfSEATroWjyny/f3puQAx5ikVZEeliIuudNwl7Q45FHZdPiGX
	Tr5S7o
X-Gm-Gg: AYBFou2W1BGcYU+EaaKrnDiMyk86KK0VSsvMFiPfjo/bujEhaF+evvq84xnZaL+4BJg
	pJDN+56cBaWK+s70G4UjhTP/sTQG9q/+CMr2hiccMM9nlW34o0MvJH/lHLdYNYs3VDFBQ3u9E8M
	M0WcPVykPqYID+0AA7yAJ3o/m+i+KQpf1m3GP34Z7CJb8LCIdNEwBHFQhWh61oKvhujibO1bU/R
	1mgynpjujX0XPsTdMKA7SCPljmHCAhHfqNzFRrwO+olTVMq9gap4j9g8/6KqZm1ZubqY/abTjTU
	j0gB4uzR9eaJ6OKASWDUvX2egbmnvA/gSWR1XtSEj8/X/+qCh472Kx0ormN98YpGJkZBIShAL0g
	66/+Q1OgpzdPB7iDz+64rlqbgZzJZWSYfKx6malrHPRBAH1FNPJd3eOjZLw==
X-Received: by 2002:a05:620a:2956:b0:93e:c12c:9b70 with SMTP id af79cd13be357-944217fdc45mr967078185a.75.1793469156423;
        Sat, 31 Oct 2026 10:52:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2956:b0:93e:c12c:9b70 with SMTP id af79cd13be357-944217fdc45mr967075485a.75.1793469155973;
        Sat, 31 Oct 2026 10:52:35 -0700 (PDT)
Received: from [127.0.1.1] ([37.142.159.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81b7fe80sm249158315e9.11.2026.10.31.10.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 10:52:34 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/2] platform/raspberrypi: vchiq: remove the last use of
 set_page_dirty()
Date: Sat, 31 Oct 2026 13:52:07 -0400
Message-Id: <20261031-vchiq-unpin-dirty-v1-0-632d3f1281e0@columbia.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMcq5moC/yXMTQ7CIBBA4auQWTsJg1Fjr2K64GeUcUER2kbTc
 HexLr/FextULsIVBrVB4VWqTKmDDgp8tOnBKKEbjDZn0nTB1Ud54ZKyJAxS5g9a56/WUDB0PEH
 vcuG7vPfnbfy7Lu7Jfv6NoLUvNvOBJnUAAAA=
X-Change-ID: 20261017-vchiq-unpin-dirty-abc9a21d2135
To: Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793469152; l=872;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=78l/cY42q3FsGgA9aAmNP7rxKPH0mp1TX7G+9tb/Zjg=;
 b=6GBLu3IHLmc8tNmCmGJOOmywqYXrR4b3Tpqba9Qxt4eDqNSVRB4ADsrAv2I5XHG7LK9PcJChH
 ECRhEGdrW5iDGoVL38nx3NAxOdNz8S0f+pObpe5WBLCNsnccHCDgQ3D
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfXxWo/7+/1JPCa
 EotifRlGUbEYHjVNiYmGb2y4qj0NdPqJgHdXFb/S6poJ2ObX7BexXO3xTACkLbKlHcSvdqk/W7p
 fnP8RWglqvXGER24X03y1cVzY/ERHA5Ykm4Qsq5Xx69xTBftTmdT8Gtm8rJFUPYh++NBzfLs4DT
 VwXnX4XXt3oySPFsoIJ8EHK66VQKemqTAPPFQz1kZv7D74n8C1bpyUUFSjOMFsFmIWKNU+TRS2N
 ZTpQHGi2GpsgqqdjlMabvP9TZlyuBn5tfHF7RTqY8np3JWFq86qaD63MWVWWSoN4Aebkl0ypyEW
 ur4LE/EVP7vkz4btstolgN7ZvLBd/TocVDjvd3POPFXlEFqZCtMOkRvG6vHOE92NGSzbH4xbLZ2
 V/bF/op79QjvKUwi8cVKClAdfqWtTzMnQUIuUMXDY9YiXp9gVoSSWOdpnPXYA5KLJG/qzzGvj6C
 NYJbB1/5fPRRZl8lMhQ==
X-Proofpoint-GUID: xuECCHsD-0anxlSSi8xenwxpW12FSdEu
X-Proofpoint-ORIG-GUID: xuECCHsD-0anxlSSi8xenwxpW12FSdEu
X-Authority-Analysis: v=2.4 cv=YLMKWhGx c=1 sm=1 tr=0 ts=6ae62ae5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=P+xgYyhW+KadpqoI50EQPQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=n5EFpTFFQUXBHQ_dOw8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA3MSBTYWx0ZWRfXxXPLwuVQdxq3
 8/yRb1l8mDSdHt6mXSkXW78S0M6tNVDJdfEvd6FlApmpQ7Qgvcti2KH925cT4Fc920JzYIAwLeA
 6REfS+Fb4vlWJ5W5WW6oc7xljBJs5O0Nm8/HL0eNsRoasMSpuPxL
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11952
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=10 phishscore=0 adultscore=0 lowpriorityscore=10
 priorityscore=1501 impostorscore=10 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_105240_382219_0ECECCA7 
X-CRM114-Status: GOOD (  10.05  )
X-Spam-Score: -2.8 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The bulk transfer path dirties pinned user pages with set_page_dirty()
and then unpins them. Dirty them in the unpin instead with
unpin_user_pages_dirty_lock(), which takes the folio lock and marks each
folio dirty once. The first patch is a small cleanup of the gup flags
passed to the pin.

This removes the last use of set_page_dirty() in the driver.

Compile tested only.

---
Tal Zussman (2):
      platform/raspberrypi: vchiq: pass FOLL_WRITE to pin_user_pages_fast()
      platform/raspberrypi: vchiq: mark pinned pages dirty when unpinning them

 .../raspberrypi/vchiq-interface/vchiq_core.c       | 27 ++++++++--------------
 1 file changed, 10 insertions(+), 17 deletions(-)
---
base-commit: 36aad21d50d1af3f6954bb0c988257a908202477
change-id: 20261017-vchiq-unpin-dirty-abc9a21d2135

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>


