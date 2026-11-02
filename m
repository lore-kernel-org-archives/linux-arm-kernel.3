Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADAF606A326
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 18:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=trBCBCJX;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z9TrVRhu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LGDqpmJ6xMWSEt4fKKeCFI9mYC6+/BLX/719ObqwWoU=; b=trBCBCJXK2XWYP
	rVwq2aoYIn7Xj+9gs03eNDNmwjh9nxWM/3DVNSHggQ3crmmHmCW4xfm2IdvkUAPRcrdzc1Fzfe3iK
	oy4ddY/xt3yX5WhzBjt/xN3eh9+qn6lqM843tC4+QWwpgGkSLXHT+e6bS3QnECs1ukw9p2xmjwRQm
	TVUe/QiDHU+EEsWIwOhkcumHPfbGHqDL2OqSG5Kyk83n/fWfth7OdRKUDu5zpUYt5W1VrMLsa0HJO
	xNCOOLegXmJcVywfcm+fP2TyIUR/FHyYurwncsHU7lTXvBrx/l2qbNDrkmy5Rcn/7Hcfht6HTZF/F
	p1hlbLTWDFZN8ki4jlSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwWL-0000000HZ9P-0UaQ;
	Mon, 02 Nov 2026 18:12:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwWH-0000000HZ8s-2KDJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 18:12:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85F411C14;
	Mon,  2 Nov 2026 10:12:28 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 425EE3F673;
	Mon,  2 Nov 2026 10:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793643151; bh=PEmx+V2MAM21COP+WbP5EuonNJZriByNK+30+1vniBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z9TrVRhuq4bQgVF5QIDinF8dpMs6YFPKusukuImTTwaWW2aN1ka19Mk4oQ5HGF0+Y
	 B1X74fFMaJir7xpDh7Vf2lDFUuYzTPjkiVPoFIePsV7Jnukw4MHOc1CDK90K3GWY76
	 W2iKkaus4x/0VPVnOGMfBnfUWeAYvLG5DVZRzILQ=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	coresight@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v6] coresight: coresight.h: add '*' to kernel-doc lines
Date: Mon,  2 Nov 2026 18:12:20 +0000
Message-ID: <179364309003.3015045.6629658616372462251.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102175751.2274430-1-rdunlap@infradead.org>
References: <20261102175751.2274430-1-rdunlap@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_101233_657818_F9FE8161 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 02 Nov 2026 09:57:51 -0800, Randy Dunlap wrote:
> kernel-doc reports 2 (kernel-doc) lines in coresight.h that don't have
> a beginning '*' in them, so fix these lines.
> 
> Also convert struct coresight_trace_id_map to kernel-doc format to
> remove another warning.
> 
> Warning: include/linux/coresight.h:173 bad line:
>   connected to @src_port. NULL until the device is created
> Warning: include/linux/coresight.h:177 bad line:
>   needs to be filtered.
> Warning: include/linux/coresight.h:236 This comment starts with '/**',
>   but isn't a kernel-doc comment.
> 
> [...]

Applied, thanks!

[1/1] coresight: coresight.h: add '*' to kernel-doc lines
      https://git.kernel.org/coresight/c/02ab6256e4f5

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

