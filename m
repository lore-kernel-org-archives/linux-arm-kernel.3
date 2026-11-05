Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7F8606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 05:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EZ+fT2kv;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Imi7wqeE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=igsohCGD/my9F05BJ5ZdAf3sM/HA3G6ndburhp8TXQ4=; b=EZ+fT2kvyvp0Lk
	jswhSk2c+t0US8+CrysllAmbzyvDa4HzAN7E3rI+Nq4n37AxlOmWo0lEz9qc1XQ70R6DDlKoLJzVw
	jP8ko4ug2H/zT8KLcytIzGnf50VIAs9oqmakTQQkplBkAZlCTHsy687DnPvQ2rIQMkQJXNxiDqYCi
	BlMdOlDm5/9ELEJu+019fFq0tmvK8ri/P1ai/YKt8G7auYhAvyvvUeRYspgWnzLLIwca3sk2dObBA
	1+vkIlvOoK781HPUn8Pr9FtU4LE9H0q/MBGvM61PwZgfleJQ4uaMIspnLMvVVaj6gBO0ZGMu+xpyN
	WcY+IOzOVXfU8pEfK3GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqQ9-00000007uNB-23vg;
	Thu, 05 Nov 2026 05:53:57 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOqQ7-00000007uMr-1Dl4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 05:53:56 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso618561a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 21:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793858034; x=1794462834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igsohCGD/my9F05BJ5ZdAf3sM/HA3G6ndburhp8TXQ4=;
        b=Imi7wqeEHRbwHrOTWeIEu3uK6j59qUg7WXjAfIxO+ytQxhNrFGGIVmKWqvSYMQINgB
         /eI7uVxkfW50vEjzO4T+9Azi7/Gg6difmBsTMh7T76XkFbXuhDq1+zeFZ488mInx/UAy
         Ht7n1jc74wr1DXOUTHegIKtmR2HYHUVV5M+UdhLEYbanHX7j1lf+DoiMxHBabd8hi8vw
         2t1Bret4EyBIIxyj74y5nV9W+oYSbnui4oYQGLzPFdqALCc+Z16hHMzQdTwE7a+Apffz
         miecQ2yBTHzXYCD+fXMaHCdARErwvZzSIYKmd2UFXHzO7GsK+WujSaFIGYYaJUMGTm5b
         TpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793858034; x=1794462834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=igsohCGD/my9F05BJ5ZdAf3sM/HA3G6ndburhp8TXQ4=;
        b=BfEX+/oyaTYToXFnEXyxg/u0o/HyzyVzBYJyislWzd2cFDl/fIN2bsCJoXNMw7uIxx
         fC99cQhp5fv836BzVYNtzk/5HTHRPZ0XFIfmN9ejHFiUWmTZ0mScumnhS88c4GMuOKvS
         7imIpgMK1kKt0uR0BMcTy1ogzpOy03B4HeIcXnDy3c9aRIV3+/I1xCuM71POKjVObtEt
         dR2gVm92fVnpw3LILToY4we15h3kkM+1IsJyfS7+vsDbmDFK1i2EZ79ttq/1HpTuTluZ
         XDKutTxg3cAlJ0hs8xZVxREQDdtoofvwEUdB46zKbAjquf/l17stNBglcVpUypM0eL5L
         DNWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPy/FOA9S5uDZu89muHOhBY4UnN0LgYPqxJyM00KcxxjyLsZy9gSPO1vPYVsvDIkJqjwPJ4jbY/5M/5GYoNvoq@lists.infradead.org
X-Gm-Message-State: APuU4Z+uMBQMIlSUpstdZkFoWR0KUI+7+tVbJBV5CtumxJ+EmrOu+yyO
	X3fI/qAW1aj+ZVkL/7OwebZnFYu9/ftWIifr01GE9dwiicaR1KOQ0iyk
X-Gm-Gg: AYBFou0rLQrgVXJxJvosI4KNkGJQdFy6Cpo32pzrOzUEckk8Pz6QmyrNqg2/JwpP9QD
	vajBj1CaiNeTD83mtNu4In09EMAyeb/K1j8OG1TQ9kqGchIH9Y79p3VwnkV8+n8nxM/3ft49iYa
	F8fghfSHZWsnlnoV/pc5qKkkHfjROr+L794wlXuOyD0gTNgA0f6u+wXxt4o5kSt9yvP7iM5s5og
	IHdExgH3decvZ9U93bU1uNvkoxFseOOm/fga7B08xc9LE4ZUYr7oSYhbOEfOkmIwl78pFnIVm4n
	p2PajQph7AICh5k1PqqjOZy72yEDMSMRVKCo/BXgWHkNlLe+idxjQKXqgZ5siiawgNwJXk5ijDS
	vFa+kvQ7itJleZGcyONxrLf/fqe270hVVntPejHo3WslEKNLmp9eIXR3PdlADITtIXF7L6swSIM
	mIkHvcjuqTGr29Fe9sewZGHNt9Xw2yiOx1TECkF2kcBLWMkP9TD3SwSVZyfZeHKT3ejLqJOsgDp
	fklPI2ahczkPcMF5jJh0cKnRZm6OZ05pA+mo7gUUcVkhXh3OxkJ6ZAjOBq6YBsu8mi4nzH31OAH
	fuRw4ridZkUuxD9OzXYmeLafFwtz7KAqRVNqLUAM9SYTJFeAXhw7X20=
X-Received: by 2002:a17:90b:1b11:b0:3ad:4bfc:1e77 with SMTP id 98e67ed59e1d1-3ae897dd40fmr15148293a91.66.1793858033891;
        Wed, 04 Nov 2026 21:53:53 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b312cc44sm2293530a91.1.2026.11.04.21.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:53:53 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: yin.li@oss.qualcomm.com
Cc: robh@kernel.org,
	james.morse@arm.com,
	ben.horgan@arm.com,
	sdonthineni@nvidia.com,
	andre.przywara@arm.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ping Li <leeonion.muyu@gmail.com>
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for resctrl
Date: Thu,  5 Nov 2026 13:53:47 +0800
Message-Id: <20261105055347.947416-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com> <20261104081302.304667-1-leeonion.muyu@gmail.com> <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_215355_333790_F21006C5 
X-CRM114-Status: GOOD (  13.23  )
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

Hi Yin,

Sure. Our memory controller MSC is described as a top-level node.
The MPAM register window is mapped independently in the SoC (the
component sits on the DDR egress path rather than being a sub-block
of a memory-controller DT node), so the node is a direct child of
the root:

	ddr_msc: msc@2238000 {
		compatible = "<vendor>,<soc>-ddr-qos",
			     "arm,mpam-memory-controller-msc",
			     "arm,mpam-msc";
		reg = <0x0 0x02238000 0x0 0x1000>;
		arm,not-ready-us = <10>;
	};

The first compatible in the list is for our platform glue; I have
replaced it with a placeholder here since it is not relevant to the
binding discussion.

Notes on the properties, in case they matter for the binding:

- reg: the MPAM register window. Only a subset of the architectural
  register space is implemented, so the size is the truncated window.
- single RIS: the component reports HAS_RIS=0, so there are no
  ris@N child nodes.
- no interrupts: the component has no MPAM ESR block, so there is
  no interrupts property.
- arm,not-ready-us: 10.

The verified probe path: the node matches via "arm,mpam-msc", and
patch 6/8 in v3 classifies it as MPAM_CLASS_MEMORY and treats it as
accessible from all CPUs, which is exactly the behavior we need.

One question in return: with the node being a direct child of the
root rather than a child of a memory-controller node, is that a
form the binding should cover? If the binding expects the MSC to
always be a sub-node of a memory controller, we would need the
top-level form to be allowed as well.

Thanks,
Ping Li

