Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2284606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LmdVeZjm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIc9Xanj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QWQ1m2neibp5bAGpRKNHNRra+4fDpL5hqLSr90AaWkA=; b=LmdVeZjmizTj9j
	dGOm7vP2eKcrrWpQdIvCZxgqNa1L0MnIgiPnUUIsuo8fd0takXUWadpfAKZ+tQxrP1WWe7xYO2O6N
	633y6LoJP+jD0m+D1Xhs6o0UFnZM5IHKJyniNjGYuTIiKdXndBSB5EcKnV6EKrOZ0TtvOHo6g3nW9
	QYYgaYi4h7D6T5xG18by5pWB6Iw+sNa8YlhDxaevD/MmdnEbZA+8o+5GLmuMDb5a4JINWaTS+sakc
	VHJOa8HcK2oa5e8to+BoeR0AkzuQj65aw+dccYGIU3saFmfDEpWMRfParLKu2n9HzFnrjtXq6qUH8
	gvltxaLS3eR6p9qZ6Qrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqnB-0000000GPj2-1OZo;
	Mon, 02 Nov 2026 12:05:37 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNqn8-0000000GPie-0kgg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:05:35 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c46bd7a7345so588585366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793621132; x=1794225932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QWQ1m2neibp5bAGpRKNHNRra+4fDpL5hqLSr90AaWkA=;
        b=lIc9XanjuQiP7PiBQweu/9HUdDIdFZpPjp7JlPZB2co84L22PoGy/fzCfHEhKHfrPv
         GDy4GewHqcjjSHkl4Aq3QfinmQN29ODBazYsXGFvILjW8pbuqcbrQjl1yptKcV8rCuWZ
         it/dQbF044w2rTXcfWfUupwjWbHlJ2BiNikfOSGHHTyh8hhXdcyXeHNSEND45HpQGDvd
         6Sf9LLszauHJqa2wGGyW7BkMceWnHwAF9qbivaTE7RNiX94H7XF1wIe4rl6oqebpoIbG
         R+gIasDjSnSULVahAQQCuWDMryFal3hYf1PhoGEBgxoOcGUaYIKEteMHrCMAAP72eJ0d
         HjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621132; x=1794225932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QWQ1m2neibp5bAGpRKNHNRra+4fDpL5hqLSr90AaWkA=;
        b=eiUv3VLpr6vABgXE/5OeYwOVV53G7f34DODF+sQyBfhiqvPOhb7B7FQF3VdDleEZvu
         d1dd1ksaIk1c1CpSboAuaWtVW9/T4tZJ15VmnoSbt8KdL7tfsW29yoEbQYvYP5qJ72Wa
         qSRgeIfDVt7dElJ7h2nVKDY/1oLMXkSrMX0VJPsFQ6eptV27+E0AxWCwC/TXpIbhcLMa
         4WRR+Nbrgmi2/RDhCJhFW1UT9iHeHbDG8xV0kSiJfRrAIS5i1Fv1NZql7WeSDsHfwZen
         YJGYOG578kQokZzNaaFSMGZxI6hqDaAZP74QMjKcoAB68aYiWvTVhVdRcMvgigFh1ljq
         RGrw==
X-Forwarded-Encrypted: i=1; AKwUvBwDOKaKdVcFyGqX94EGoCVkXTJa0Y35yECemLDzIWglQSgxjGdTLdrTqMyu0BgQEsiSnFkuCpiKW6V0/+RKGo6q@lists.infradead.org
X-Gm-Message-State: AFq9FYKQpx0Mllmysh39hBF5Kr2DzHwkJ4E0ZTCbz4HgFyarP3tj0qbF
	Drv0oHTDap3Yls425ovYPACxONp4Bg4oCnPArnbmoqDlg06o3X17/ouc
X-Gm-Gg: AYBFou2Hk3X8w/ANd7flYxGRzRXvbPda84tcGkvuK7Zn5LgSB+a4CPc+ljj+grEfNcE
	LcYNCmjZWO3rn2jhY8AI8EtiMGvSfp8zoOpXI7ivITpI5+B2CYW1u12PwnBWkigIg0/nuwfjepm
	FnLVtvDERqOQEhNwJtYOpRCzm1C9x17kojY3V+rPOEEdbXwiUrhC4alq9K5FH9nn2YddKUx5r8u
	LpyVBuk3H3yN4akEQMuTE1mhMzxH4oWhCNCV64BRCQp1Y8JZCMjy318FNI2+ae1g1lzr97uXz0D
	9qkhhrHUTIbs24yUO5zpXyFMdNOTwZ8cOro4F3VGceqVz/JCyICjmofTG4OXiSU15BdjkXf6wcU
	1jksqmdLfUX82Jaa0a1rY63ey5oAj58wKFs6tdVMlME+vwOew7kubUcGCO+2qtuJWbybawAMbAs
	4NpuZrFQ1GaJWEQT5rpfFcW9zZFX++eOQn6QGzkpzRV3AxjTZyH7QEzlEOnaQDrXjQ3CPi1qgza
	Jd97FCnv6UiDK6tcItd4ihwaUJPSHFuiJiDEnzvu3SnXjJyOBx5LOej4e5K3u80X/QW3xCazIDO
	iiFe8wFJA7lwXa3xACDt8fY1r6eCUYRk5g==
X-Received: by 2002:a17:907:1c89:b0:c46:d493:47be with SMTP id a640c23a62f3a-c4ca7ac23a0mr868597366b.19.1793621131875;
        Mon, 02 Nov 2026 04:05:31 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe3c449sm379033066b.49.2026.11.02.04.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:05:31 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor supports it
Date: Mon,  2 Nov 2026 20:05:24 +0800
Message-Id: <20261102120524.1213679-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
References: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_040534_246314_D8C51CB8 
X-CRM114-Status: UNSURE (   8.18  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ben,

Apologies for raising this directly on the list - hardware questions
like this should go to support@arm.com first.

To answer your question: our memory controller is still at the FPGA
stage. It has 32 PARTIDs but no PMG. After talking with our hardware
team and reading the specification, I had wrongly assumed this design
was legitimate. Our intended usage was one control group in resctrl
with no further monitor groups underneath, so the PARTID-only
monitoring would have been sufficient for us.

I will get our hardware team to review the RTL with Arm support, and
will drop this patch.

Sorry for the noise, and thanks for the pointers.

Ping

