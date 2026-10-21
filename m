Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345D5606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x2yJgxcg;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XKYIgXR7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5lls2oC5CObBW2Bul7MC957A+BWsqy4OwbmQJto8Ic=; b=x2yJgxcg5NKrs2BULgusLC8/9R
	pdlMC+lQAHdMk7X27dWI9qR3Lx4O3rP+RNzhM+EoyYhaSNhVzqH7UnTZ9ByRUjwcQtX8iDp22Wg/3
	Jcul+/kj2PMB1nwgTVW+qq8qbyW9fjZbCFpH732hwUPCNQ7wW6r802czyoyK8ROoitQZbFELxVFz9
	LNu3u+GIr25Y8Xx9hEPvkn+uu8Ml00rhFjz2S1t3mt+qJOEhHQNF0nS5clG04xs7L6iF/Q0MGX0/Z
	nAFbvWoL5/szEhrie8o2+I4KLLCAfSif0vhd1RwgVLkOxkHyug2rSV0ugudAqX9B1WCFsFNBxiiAA
	M4xtzduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbCw-0000000CfQj-0XQp;
	Wed, 21 Oct 2026 18:38:38 +0000
Received: from out-166.mta0.migadu.com ([2001:41d0:1004:224b::a6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJbCt-0000000CfOO-0qbk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 18:38:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=K5lls2oC5CObBW2Bul7MC957A+BWsqy4OwbmQJto8Ic=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792607911; v=1; x=1793212711;
 b=XKYIgXR7nPo5vlaRLNXgpB4Ydzc7kQzmVVAMY9cvnkPVT3eqd+hMV3C5XY7o0sovngkGOyIF
 6bBSI0J+0U43AXwvE7w0N2+Xhry3512vXzqbAcov/C10fy7VBt4YvQXaZ+SRhx49kcGfZ2m6ARE
 vHpAUj3nQZfwVT5jncwECRJ8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6590e4c27ac6d001;
	Wed, 21 Oct 2026 18:38:31 +0000
X-Mizu-Trace-ID: 6590e4c27ac6d001
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso1032e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 11:38:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1LMu6PkLjRxnE/DVB1KiLGz50//RqI9cMD3r645MwSCivM/l838Cc0Hw/rbQa/l8YcCFNK6orfnwz4s5+6ZEg@lists.infradead.org
X-Gm-Message-State: AFq9FYJmW6cmmZEMnhZ79T8jHGBLwy3sYGA+7/klI0d0fCwEH000zfxC
	Ayy2HFQhoq9MDenb9PHvPCGZsUH/Zvlqv6yWk5Dqb+qEdkcak+Xi9v+q7TLljuhaV6TbVa9gSHx
	4FZPMZy3i30IXZomW/BZvZbyrjHNXcIM4K1fcMs8Q
X-Received: by 2002:a05:6512:12c9:b0:5bc:ed54:d5b1 with SMTP id
 2adb3069b0e04-5be66f68de8mr421311e87.14.1792607906645; Wed, 21 Oct 2026
 11:38:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261020064306.1542865-1-fuad.tabba@linux.dev>
 <atc2Y4gHwtGlffns@gremlin> <CA+EHjTxMGFuZHPp8ULkpUiGhXos8f1B8kZ1FDigFE7afR=X6AQ@mail.gmail.com>
 <86o6cnywvb.wl-maz@kernel.org> <atjSmLQbm7-_oRPv@gremlin>
In-Reply-To: <atjSmLQbm7-_oRPv@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 21 Oct 2026 19:37:50 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyCLkHwU3NU_s9zeAknG0nU-C9yeB_8VzGgaZvka3vyvA@mail.gmail.com>
X-Gm-Features: AclHuK9BI7fqOPfsqs2U3z4LJDf8paxZf7HpBnvRQgffL6hBNeQHYJuBSCqAjb0
Message-ID: <CA+EHjTyCLkHwU3NU_s9zeAknG0nU-C9yeB_8VzGgaZvka3vyvA@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Sanitise ID_AA64MMFR3_EL1.S1P[IO]E
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_113835_445454_5E8E860E 
X-CRM114-Status: UNSURE (   7.99  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Marc,

On Wed, 21 Oct 2026 15:03:04 +0100, Marc Zyngier <maz@kernel.org> wrote:
[...]
> I don't care about the name, but I don't want the rest of the proposed
> changes.

Let's leave the rest as it is. For the name, would you rename it when
applying, or would you rather I respin?

Thanks,
/fuad

