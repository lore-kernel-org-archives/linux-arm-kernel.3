Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DA5606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 05:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DPGLoarg;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HrPk2uj4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yZJnTzcgAEufapruv+sU1p9fK/mqyPTcRB7MRChBfE8=; b=DPGLoargysYIJo
	SZxzHIaROBkoMqRNvRpuaOtndcF+vIsYVjTYL7dhqaWXZbWnGYseh6XcIYttsm9Wl0pVoX0A1m/bb
	28MbXk4vWZmxJW3r8IkDFMAe39sHdvD9lQJ8H1IkjVTSIHuYN2HY/ziQu4tpPcd0AhIkBLAyEAKED
	wO6ghrOCBVB4owNW8dL19roDUEL8PPgve+c/Nx/fC6AB5FV0KG3UZBj/xXkWCaMILf6NofxbkuFRp
	+kPfbuAJ1qUHlEW4uDIYZNsebfpe407dMfX6RtkvdeV2V8Cn9+GjcEPqvZHmQVwgBPHHjeQJ8Px9p
	6njzAQboLDtGO5FQMwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeuU-0000000AqSA-2yUV;
	Fri, 30 Oct 2026 05:12:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeuS-0000000AqRW-3N3I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 05:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793337131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZJnTzcgAEufapruv+sU1p9fK/mqyPTcRB7MRChBfE8=;
	b=HrPk2uj4pGguWJoa9n5XMlZ0OLfQiWmhhRa4oLirmwwlKxrt5Zsw7Dsnm5NLOOR5bOXsXL
	uL8ymDyegdP2qAO9X+9MHQHl5q5NaTPBabYnxb8nMjZLrma5ldOCH6cO2SPQBEV9BV+EkX
	Q1WRQQW1MAYzgqYI21J4ejId2OYRAJI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-ERZF2T_wOAGSH_B5n5tarw-1; Fri, 30 Oct 2026 01:12:09 -0400
X-MC-Unique: ERZF2T_wOAGSH_B5n5tarw-1
X-Mimecast-MFC-AGG-ID: ERZF2T_wOAGSH_B5n5tarw_1793337129
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso373736a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 22:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793337129; x=1793941929;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZJnTzcgAEufapruv+sU1p9fK/mqyPTcRB7MRChBfE8=;
        b=EYwpMgpSAjyukE1VHel0+6vgukI6FBPYzhHNpsjGdLKoLRlF2rFE1Rfi1X5Lo+dxXp
         wuCkrX0ZajVR5jGedXyTB86knZ1BDnyEdGKZuUbckUpnuLWy9RhZY/wZSscvSOHLGLj9
         ZXlBO/T7DTJ4KKH8sITKP3ZyKw6NJhyeugapm4qySyNEADBebpjfs2V8LC23ofDSJbZD
         0QjFi2LBAE8W5WyJIB0M/yXbFyoz6piu3ke+lreSQ6cXbHtoucfLDr1kel2+Ggk30fZG
         U/1FFuJ2MOq7bb8g7PkKhX+6JSGbSME1wHQAs50QrfCp8lhtE4j5t/2jRQ4Po13lKOon
         DXyg==
X-Forwarded-Encrypted: i=1; AKwUvBzjf4eSD5vWs1vg4hGG2IeNmKEEqKDYS2mtHhgqLPAgHxZEo9zyK4So4VVYB/9c/zToYk+b0vJB59YXzvXiU7dK@lists.infradead.org
X-Gm-Message-State: AFq9FYL8Y4mS+LAggnZiNKeiNlqYq8d4sJiAEwYJ45ggpalTrouqjsjE
	KgVZwoD8OVdsgv0YhkFahiNeiFLteySog6bnKV+870ejj34UIJrJdNDH1QSeRQZ7taK749HbaQa
	CnhkFOdjt8aEmhGE2JDCT68j5SB+jyf846WSwdr79ro1FINh6mNQ27FL4yKLADViBxjl2d3VJIm
	Du
X-Gm-Gg: AYBFou270doA0v33c8Vw+ew3jMvxq7g1fXCWyjgXIyLwpTgx7D5h1xr6c/IZg8p+w6D
	M12xYJFgqRqf2P5/6+ckFR3OWyfefww5F6wdpuSR/l2JrOedURjGJyRJrcRi+iXCyXOkdsf3I+/
	pRLcpfWhrK/vBJ4TbZgX+PFZU2oDBVAfEC82TrGsZgbVKwVwQ+xNAhulxiM7zXGsLI7biVHZLNF
	Tn1H1+QJUg9JHCy/7xYm4IVKrPi3p6ubPCnCqKF3LZNEkRSI0FVL/+UBXeZkLqNPt6i84gIrZ/7
	ZM0q7ZRcCWlQMG3yn/z1wXRM/QdimTPd2BJDv0nzaKGP47IXwrctbJYg4xY1sb9PuMFU9ELTfoD
	CHw/OJKPk20EKLKccNDguP3ZvLWxtGXq/oRDeBjAWZWe8pwkOesUOcomtO96IplMdJ4hy9O2kot
	OmtqVSlhdO3YVIAlM=
X-Received: by 2002:a17:90b:2f87:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae897f6d60mr921875a91.59.1793337128713;
        Thu, 29 Oct 2026 22:12:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2f87:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae897f6d60mr921866a91.59.1793337128336;
        Thu, 29 Oct 2026 22:12:08 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae84542a13sm2349712a91.5.2026.10.29.22.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 22:12:07 -0700 (PDT)
Message-ID: <d9eed4b5-e9e4-4699-ab5d-197141a995d3@redhat.com>
Date: Fri, 30 Oct 2026 15:12:01 +1000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] KVM: arm64: Remove stale remark on canonical IPA
 alignment
To: Wei-Lin Chang <weilin.chang@arm.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Leonardo Bras <leo.bras@arm.com>
References: <20261029175238.3214788-1-weilin.chang@arm.com>
 <20261029175238.3214788-3-weilin.chang@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261029175238.3214788-3-weilin.chang@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _caHIhgycHBpQj6yY6v_Gl8ywZ0zhymLnkizsOGaHA8_1793337129
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_221212_933155_887830E3 
X-CRM114-Status: GOOD (  13.18  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 3:52 AM, Wei-Lin Chang wrote:
> Commit 3b8ce2b5132ae ("KVM: arm64: Use a variable for the canonical IPA
> in kvm_s2_fault_map()") created a variable to store the canonical IPA,
> instead of calculating it when needed. It moved the aligning just before
> mark_page_dirty_in_slot() to an earlier place but did not update the
> comment.
> 
> Remove the stale part of the comment.
> 
> Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


