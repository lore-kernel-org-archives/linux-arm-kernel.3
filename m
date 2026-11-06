Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD74606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J6nhuqkd;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=r3862YK+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rKxzvGAlPRe95V0pVMlRztyt1v5h62ch9oQN2DY4Clc=; b=J6nhuqkdmarlqZ
	XLO5oa8qvpbcWDnfKKbLQlpaGxoJ/Mou0rnZOx8EKpjgn08TMsSb6OkZgbAYjZr3emal/fp8Z3OGt
	0NBGQzbFm1WhrI7PjuLlWl/zIyrL8WDGJZPoG//KSuXtPx60vKdNIxcv85Q0Y8yBaP+gvKAHVuDTI
	RhXYnW/q3+DQzvMBqjdOKdyZYHBwnfjNFkaRK4yfK8h4hrS0glY5VL1LuHFQ94oR1eVVFL0EeEW15
	E8yy6PF73wiVBs6l6+938wvvjkaHZ7mIgmaKjs2Z+XlHpHcEzjQ5IkvUyizae7QvqciY9ex9bdTZR
	CpBe9rrO+PTgwRy+TjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPESQ-0000000BSpk-0PRf;
	Fri, 06 Nov 2026 07:33:54 +0000
Received: from mx5.mail-out.lima-city.de ([91.216.248.207])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPESM-0000000BSoL-2uHL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 07:33:52 +0000
Date: Fri, 6 Nov 2026 08:33:39 +0100
X-Lima-ML-UUID: efbc4d95-1bba-426c-9435-09581e33fd37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793950424;
	bh=rKxzvGAlPRe95V0pVMlRztyt1v5h62ch9oQN2DY4Clc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r3862YK+9lpiv6qXkmsupUVvoPmKKTuMSkwmoXBtEt1J2UDdsTGZQxuZaWt7uV1Z6
	 aVB3DRULdeJM38mX2EwLQ4byQeH3TFmfP4nVeTiduKUE2ty+lAw1MG2XPWjgduG55v
	 c2izJpRl2HNikrx/vcy6cU1U3ApgLRU5fUxW+FVFsf9kEvMG5xyDtP9n6UlzzXbt9b
	 ygBAx8VYgcCEBKBs5OwV51TyDPv+haXs0MzCeyu7afPXUc7njU+bZxE5ond6DiVxO9
	 0nm5Ef2v4Qry4tTJ5GfxccylX5PaZJceG7Uawu266B74Ln0S/aHn4nPae3u8hhhrnj
	 V07HqlsjLQ3CA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Myria Sarvay <myrialsarvay@gmail.com>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 sven@kernel.org, j@jannau.net, neal@gompa.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Yossef Osman
 <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <20261106083339.677cc75d@kait2en-mbp15-1>
In-Reply-To: <au1uH6uxtsw2vHfP@macbookair>
References: <20261105085750.120392-1-dev@deq.rocks>
	<20261105085750.120392-2-dev@deq.rocks>
	<au1uH6uxtsw2vHfP@macbookair>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_233350_931673_33C15339 
X-CRM114-Status: UNSURE (   8.80  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 17:05:19 +1100
Myria Sarvay <myrialsarvay@gmail.com> wrote:

> Just wanted to point it out, if you hadn't seen it before, that Sasha
> has in the past sent a different patch [1] to run these priority
> commands. They seem to take a different approach to when to enable/run
> them. Wasn't sure if one was better or worse though.

Hi Myria,

thanks, indeed I hadn't seen it. Sasha's approach is the better one
IMO, it only raises the links that carry audio. The dropouts I measured
are on the BCM4364 of the MacBookPro15,1 and 16,x behind hci_bcm, which
only needs hci_set_brcm_capable() on Apple machines on top of Sasha's
patch.

Luiz, let me tinker. I'll drop 1/2 and send the hci_bcm part on top of
Sasha's patch once I've tested. Then we should have it nice and
consistent.

Andre

