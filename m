Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D0606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UBYYW6Ms;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lhndge+D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7GCadaz+EjyUtDNGp4iFFF8gzxEfhR5CHvprcMIc3D4=; b=UBYYW6MsWWLGvu
	ck+RUh/H9u+awn+MGh3fO85AD7+FespvJOyKxIvfo6Y11n3D2TxXFBTBjuLWtJFdHvTEMk7pvLkXV
	OhdmsWUCRvCjaPPg/s33C5dtvZGE1EXiMKVqB92TgLdb/LCt3QLpRFsn5ZNvcXJKlYcLvrjYTIfyF
	7Rl3/nSOgI67s7+nBNQgUMcKVba+jVeoqpj9SP9f5FRANanjdssOThgrMEWtXHPNuBDfXvAKL9RvH
	SZU7eGhhs4okEBwBJTZsO9Im1Qh1wOVwn8F1L8hCR1B7kM50wW1g64W0FBOGktrAxFAEoHBXHn+5x
	ccJ3C0+yuUIXhiZVZ46g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKIs-00000003XR3-0XV1;
	Tue, 03 Nov 2026 19:36:18 +0000
Received: from out-104.mta1.migadu.com ([95.215.58.104] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKIo-00000003XQk-0Klf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:36:16 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=G7KaqzRmIMer3j1Th54NKYLobcV9sl8HLgmBiZenzwA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793734568; v=1; x=1794339368;
 b=lhndge+DqYs3tfg/liaOv0xoCfapCh2cKEU1ZfrmN3kfCnD2H25OyajNLYl6Y2YIixcy+CFM
 J5zW/ZvG3noyAIIdcRXjV6YKbZ8ozYN0O4sfFZefPbvXJos0RcnqypU9FrwVUOYZ9QXkyp1CgAg
 CwWL1oRRPT034jP1rOkZs6KQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a12960df4dbf8237;
	Tue, 03 Nov 2026 19:36:08 +0000
X-Mizu-Trace-ID: a12960df4dbf8237
X-Migadu-Flow: FLOW_OUT
Message-ID: <08e5c832-ec20-4510-b540-d81f3d9b178f@linux.dev>
Date: Tue, 3 Nov 2026 19:36:03 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/15] drm/tidss: Use the AM625 features for AM62A7
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
 <20261103-beagley-ai-display-v5-6-f1c8d0e52bb4@ideasonboard.com>
Content-Language: en-US
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
In-Reply-To: <20261103-beagley-ai-display-v5-6-f1c8d0e52bb4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_113614_354931_305A106C 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 03/11/26 11:34, Tomi Valkeinen wrote:
> With the recent cleanups, the data in dispc_am62a7_feats is identical to
> dispc_am625_feats, except the subrevision, and the only place where we
> have a difference of behavior wrt. the subrevision is in a debug print.
> 
> Drop the dispc_am62a7_feats and use dispc_am625_feats for AM62A7. The
> debug print will print a few extra OLDI status bits for AM62A7, which
> are not relevant as AM62A7 doesn't have OLDI, but that is harmless.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>

-- 
Regards
Aradhya


