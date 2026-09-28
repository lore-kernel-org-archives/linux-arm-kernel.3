Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0F7CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyuHMcU9BbS4rZO3qSAgRdBv7BTX7Z9PJ3I+SxV2FeE=; b=g6ghanaJts6SAkLBaJGU5Uek92
	9o65p8uDWWyHKubqVAmUpJID/WVOJpUkqveXZsWwsJJWA9Ibt9fjLjbhOpfHkjGFQv+daCH9DFp6S
	DDN/QtULAX65921rLKC8sCDuCZSxBrzPGDvho4JVRd6QxbQKmBhWsQCIrG+gSd9rTuO4ijglrj0rI
	OwcGgyuXhY7VSzqvHyKJ0oe6vGczHuUeIXCOJ8fmbFnsTOL/c+LRDKbNZ0qvzanbKVU9M7+C/SXR3
	PNqmCA20gufq8CDW+vq3/Z28tOX9t4uTxkdjOeR1GQlyTlvAsPVzouPlmaf8+YkIKoi+4XLZ/SytV
	Fk4H+nRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFRo-00000001EJg-3VXb;
	Mon, 28 Sep 2026 17:47:28 +0000
Received: from out-162.mta1.migadu.com ([2001:41d0:203:375::a2] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFRl-00000001EI6-1D52
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:47:27 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=XyuHMcU9BbS4rZO3qSAgRdBv7BTX7Z9PJ3I+SxV2FeE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790617643; v=1; x=1791222443;
 b=MhExsRLC6gtZauHlznNS0L1JU/j+3gnTSvi5os1hghOGMcg6M4xIdxpryUEw4l+w8hrTsutZ
 nGp8JAzcCXM9+jRYv0mRePcpWVfi3YCnv7VC6AKiga6bi1+mRUPfQQEZKf26BpHtzleB/4nPTNy
 ScYO0p6qqm8y1d57Fkq9OkLs=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b3713235a6ab97fd;
	Mon, 28 Sep 2026 17:47:23 +0000
X-Mizu-Trace-ID: b3713235a6ab97fd
X-Migadu-Flow: FLOW_OUT
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ab5386c105so1292a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:47:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByhVKZwNjb9zL+Ag5P7vsW2NCjykrMumYZS9cCvOb2rCcJh7xf1UWfkrWetH/8w/njsL43msRZYxZsf1snko1xu@lists.infradead.org
X-Gm-Message-State: AFq9FYJSq2U2wtIfl6OjcGVPYcK+08usFYUABJ6B2ratg+/8scQlVDHl
	OtKV4VWPMgxJTIJSaz3yiY83FoWMSMuXtkYRWsEx6sTXPQFSshAtWDB+WmZc0ibfP/Nm40iAcTR
	LqwDfXXY5ZpDZBRR4MBGLMw6H9xvnWxag3QTk36qA
X-Received: by 2002:aa7:ca57:0:b0:6a6:967c:3186 with SMTP id
 4fb4d7f45d1cf-6ab01ed939fmr94944a12.2.1790617638152; Mon, 28 Sep 2026
 10:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-5-fuad.tabba@linux.dev> <arqaNHGzVfMpVha5@kernel.org>
In-Reply-To: <arqaNHGzVfMpVha5@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 28 Sep 2026 18:46:40 +0100
X-Gmail-Original-Message-ID: <CA+EHjTz=sKCZpQzLkMaks0o5hR-R=ACKVinPgwzAiyVUubirxA@mail.gmail.com>
X-Gm-Features: AclHuK-Tq_Aet2hB71IGOYbMLUlrt7UHvVGW8T4ukejDyUoOFxO6nR4iiKf3Ohs
Message-ID: <CA+EHjTz=sKCZpQzLkMaks0o5hR-R=ACKVinPgwzAiyVUubirxA@mail.gmail.com>
Subject: Re: [PATCH v1 04/10] KVM: arm64: nv: Return a failed stage-2
 descriptor read as a fault
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jing Zhang <jingzhangos@google.com>, Karl Mehltretter <kmehltretter@gmail.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104725_829865_5DDE64CF 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Oliver,

On Mon, 28 Sep 2026 17:47:48 +0100, Oliver Upton <oupton@kernel.org> wrote:
[...]
> Hmm. Rather than fixing these things individually, I'd prefer aligning return
> codes between the S1 and S2 walks. I agree with the approach; negative
> return codes should be reserved for host-visible failure reasons whereas
> everything guest visible gets communicated through s1_walk_result /
> kvm_s2_trans.

Makes sense. I'll bring the S1 walk in line with that in the respin,
with the Data Abort change on top.

Cheers,
/fuad

