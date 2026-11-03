Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579BB606FADF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0QbssCCj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LgnaFebS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/rEx9xsJMA/TnhcQ+QAyFw753KGccvIQfoQPHH40/e8=; b=0QbssCCjIS0HO3
	7Zuii8ooAGImeouSuVguSQyZYNu5zTDXpOeFzd+Co3sxurtu7NYZOMnkgsLFNmngJs5XaUbc+DEXO
	lYjtE+WYdUgkkpzLVNAA7WzEplzCLRBxUTjleo46pf0sAnpk0+re9QJnIBTlpDOc3IPm53C3MjI8A
	ROS6ku/rOGDe8XmXbirr3QyZ3WBwZxUaSG49D4CuC87Vk+ZUdWTTZqXilwYp0yS6Gchab/9A8CMlo
	Sraz5Zjz8JQrTb3UWxBbevYg589t2WPLKX7fm2eAL1+Cuhqq/lXjrOXbmF7NGAL6WQ4/ovsj0U7kU
	U8h7RPyjtEd/P3x5RZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBEv-00000001qsv-3sqp;
	Tue, 03 Nov 2026 09:55:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBEs-00000001qrj-2wxf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 09:55:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ab41538192so3171167a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 01:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793699732; x=1794304532; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rEx9xsJMA/TnhcQ+QAyFw753KGccvIQfoQPHH40/e8=;
        b=LgnaFebSjW0f6GgMt8g1JULGsg31WNZ1+fCDQbcSF0Lt/Sn1z5d2N73+ecysrDwrRh
         55DR6d2p5Z2B6wnyWa4sGeG5fbQ3h2Dekb/PZQKCWXpGQ+jo21L3blT9P+zSuErc5Bgo
         L/Fchy+iJ5/R1+hzt7x7s0PJumWLhmP7C80PbtY+YMawbxVMJFUt0xMRzA/JsS3bFIrs
         2CRpOzbjH7HHdp1B6CaGaRLuxidVnPqL9udn8lLA/oEs6a/EGHGQYpYIItNi277LO75O
         N/bqmty8Zeb4rAAH+pOwWuXhs7H1SDmVkbN1UN3htSq4P7dIWC6eWQwuJK8qseijbRhs
         jEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699732; x=1794304532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/rEx9xsJMA/TnhcQ+QAyFw753KGccvIQfoQPHH40/e8=;
        b=arB2VljSaCQvkT3aRhzCxnRmMAJzCE38GODit7lITtvjrazUO2rpR7zmZ3T0k0Rxba
         uisHivRJCLbA9kluBjfIISDQDk8JhIMUg8wIOCZ3f9DUtcZ+xkXUuEUTKGrEcAldtdio
         3B78VTeWCh/a268YWmV563jYpC4eQDnYYh0+PWi1s/D/duqh8GipJfcRJ9AdyZxZN9KF
         ySuxlCNrnqIxdUBULmX1w35pF5SK8D2b6I0Yk77ZgH8HNWXOiPsAqrNyQ+kFscTbnKtT
         7hbL7DlRzY5ercQSeTx1FlRL2Iu1e6kHQaAQxGo/3oi5u53wysvnK+dqMyttD9qBLHJE
         vG7A==
X-Forwarded-Encrypted: i=1; AKwUvBznMBs063n059jIX3uHqxlL8YLpafwm4AP5rFzfbxap1Q21Ch/vl+Npwh8Sz1NzVdYLLG4RtTysGr79F8urjM3w@lists.infradead.org
X-Gm-Message-State: APuU4Z+Iu9FQrUJEEqYkJS2/rVgfXbHbhJ8RbQYYAIWVrVq1T71DfNPQ
	apLk5ynOmDXvcmuFh3cNvTA+vE/8yOiGy/D8b055LMuQB2if4DHYb+Tng1brXA==
X-Gm-Gg: AYBFou0quyR6Pru5Ye21s4ONgFvUjhsSR1E3jXRjcOSG9C+2D/PANwttVk0QkCwL28D
	qSeUmuwLYspYUaYmmU9YeTcIyY1p9wKE5HBa6Ypgfxxu3nSc4GU0/qdh5lphHFkYzL6bot7OAPH
	75VXsNvwqKZTgwpPGJ93/visscejdsksrXDY2wdIDaKHy+VN5G85jTWqb4kqpCwmYrhrzRbqjDe
	t6db6O6dBX1P1I+b3wdJdk9YYreF4/PMJMce6nWeKh3TaFjBmMpftieNdZ6m9gVsLwBqmfu7PBK
	WwS1iaO9cn63TRajVjGgwQeDdACW89cSac/hrhAbp1Xmr4Na1FZXHlXvv4I0/bzstD8+qBzk7V0
	gSA4XwD1ASCQjTmsGCkUiMOrQ7nCvP1HZElWlprQP1Yaj5cr8hBkBUUsjIKRrgzmpTwTRZpwld2
	0WA/oSl9Zdddaf5OgM0Hkq9SC9Yp3fr+ib7BtZxAucs0vpRYK8BhJv+tEdONz5a+XJJ5wvrYmdE
	Tjd5qz9/TaCIpb2Knb9s1M5ErMtrZWtGdkk3Mx5LYiOWlILsCuFpOAViC0Nzq8E66lsta2vfGnw
	t2Y8OV3yypK94agBcq/WmWqsC0tsLBEHXS/Y0Wewdv+mTwq6EDmvnfs=
X-Received: by 2002:a17:90b:280c:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3ae895746f6mr10607167a91.9.1793699731765;
        Tue, 03 Nov 2026 01:55:31 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c69d8e2sm3505470a91.12.2026.11.03.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:55:31 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: ben.horgan@arm.com,
	james.morse@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com
Subject: Re: [PATCH] arm_mpam: Only program MATCH_PMG when the monitor supports it
Date: Tue,  3 Nov 2026 17:55:26 +0800
Message-Id: <20261103095526.238470-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
References: <912dbaa0-0fc0-46fb-819a-6594538b47cd@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_015534_778163_C697EB7F 
X-CRM114-Status: UNSURE (   6.76  )
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

Sharing the outcome of our discussions with the hardware team and Arm
support, to close this thread:

Although the MPAM specification allows up to 8 bits of PMG, our
hardware team found that the DSU120AE and the Cortex-A520 only
propagate 1 bit of PMG. Assuming 1 bit was as good as none, and
without consulting the software team, they considered the 2 monitor
groups it would allow dispensable. So the MSC they designed
implements MSMON but no PMG support, and the bus carries PARTID only,
without the PMG bit.

Sorry for the noise again on this one, and thanks for the pointers.

Ping

