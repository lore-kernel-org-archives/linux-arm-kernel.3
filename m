Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA5B606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wFGGRpXn;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j+VFRwAm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=; b=wFGGRpXnpwqtB9
	bIONgPzoy4q0dWP2lZo5/vPZ/4N1FUzwxR/RG553YWEWWoL+nPcm0YYyfkOK2WO07QZNJ8ODdOzQQ
	Xt+1fWE323NnE3FRNXOq4oMZ0IuwTPeelZRU6GXaFSBMcE2nmjzmoaYWv1CWc2w0A3oqQmXw4VhiO
	k8aMx35UlOx4q/6RBmKq3DzEDP1DKa6ppkSQPuHxXuLDzawsgkuJTgoZicznHwtTo4yUrCYkOWwKH
	I3v3mH5nbkjD+aNCz0y0H1eJwkMsv/+75gyrC2VPhc9Pa0SPSNyR8HaIYkjeMkptjq9+13jAkw4Hg
	NXFnya9iATob/EKw94Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKd7-00000002abC-0lNJ;
	Mon, 26 Oct 2026 13:20:49 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKd3-00000002aaa-3Aae
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:20:47 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so3984286a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 06:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793020843; x=1793625643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=j+VFRwAmqOxDBF8+/hnJxqthurHRA/ru2BGxwJv/ze9C4aukiQ5HxVIZg26k+bV9h5
         ZFbztelQD6MEkxc0qR8Ri1Fxt0uwaq2F7w0Qu95U4uEfCXr3k1Pj2bYPOLqS67jX4l4f
         xTBLhKptzLiRvrseHhL2+geUq+8tsAVELAhpMi3zc2SV3R0kZlLhFRvIcJ7ebSm5Lnaj
         s7PmN3aQOV33Tb9+76UqceUjY6q+nueBHZxVjWCcdFV9jIPnU2mtWNuFaJCSj14Y9Co5
         vooB5qtaomahbVHBIHsxtE9s2Aoy8wR+CHhlPiNh51nVEzH4cjg3/Y3iIDmAi3V3sojg
         Oigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020843; x=1793625643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0kGdvRUS0dLRvNimoHsfs/WP9lwMRZf3ZAqeb280LWk=;
        b=WFoJK6Obd4eKmjFEIpr60tmO9/057DXFo7+ClKuvmWClJhQlkab2RgkPjKKhT3oDw/
         BvHXtGbb8LO++B+E+6H1nOAArA1s30XnviqW3ybYk9HJ4DNMrLwJx41ErW268Zxwt2Ds
         LazwIUEpYfkBrcNFRj3YqPbkiIatB17ZTnQO4qtUa19Ort0RONwPqTzGkNrgUSkEYMwR
         xrzxcP49Oz2Tu3/b2bMlx21aaS2f8p3nRBI8KQQyytMwjYEUaaCAxWzxnLO4q4q4TOgF
         L1+pR6HQa65J5t9aGoEUpwLO2QGCRC38cqmdlv/YHRDIGPev1vQe6toWNrP9WZZPLEKG
         pSvQ==
X-Forwarded-Encrypted: i=1; AKwUvByMxS7o+SbBalwLZRcmDwxtW3x1/Y4qVcpii19PwralA0vpEPy7CGvaZv85OZA/H9r9GSBW45qnP4PpBwfW/UqL@lists.infradead.org
X-Gm-Message-State: AFq9FYJCHgvTsLsbRFF8ZTusjSBwMfuvOmqJzjaS22n2dZXQhZR/7/f8
	B5Jmf0q1KmrSFqrdABItC/h6sTpcX8MZa/za1ubyG/9ajlpnhjX1RFfT
X-Gm-Gg: AYBFou3fdDuqbN9B21ILRIByv2KtBowM7iHP+n09gcDewDvtIQNmRFNw1Cfk+HBlKDD
	C43cntwrAItt98uHFPOlw7UaOV+I2ALRrFHMk59TO3XAjUUC8hry1HJObxjAJs16o4TZGnjhAf2
	Rcof9fEjc5KwOJFnZEijk7KNSWN7yeMKATuYLKRz5X9cE3XHicjY2nmM4FiUKqMOKOEBFTVNqlM
	ZSH703QOyCbVZEG7NdEmuTBOTAGgZ0MXDzlQ+8laZeO2uHDSqjmIXBKHCsv/pX/VEEqYIrVntL2
	vNqbQ+FpoeM2IUPiJhCPGL0Aj5Jcfys/yckICCfL/cCiCfZxAwD786dUhzKbGpOQG92ILnOgtmC
	qhz/7XPlHDVHIlQ6uzbtCaxLAmUV1CBORKuYIh/fGXFLapBIvmbCWJqhb/AWIlv91A0NJ8RCCp1
	rzm8W74tMAYB4nPo2JxYtsPS9qoSYlSSQvUPLAgNXQmimnlT98mEKf8zsbb/sxzz3FD7GTiIUzn
	IMzT9yGWCYPW7dLnMKnYMfWNa34Ui05mFoyb7xBpsQUG6aB
X-Received: by 2002:a17:907:2da5:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c46bde088d3mr773260366b.28.1793020843337;
        Mon, 26 Oct 2026 06:20:43 -0700 (PDT)
Received: from beelink ([187.13.23.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd35004asm314324466b.4.2026.10.26.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:20:42 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Li Ximo <lixicaicai@gmail.com>
Cc: Wang Haoran <haoranwangsec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH] usb: gadget: udc-xilinx: Fix wild pointer dereference on empty EP0 queue
Date: Mon, 26 Oct 2026 10:20:21 -0300
Message-ID: <20261026132021.220391-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023073131.637062-1-lixicaicai@gmail.com>
References: <20261023073131.637062-1-lixicaicai@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_062045_803888_A08008DB 
X-CRM114-Status: UNSURE (   5.33  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>

