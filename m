Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ABB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k6/iXWel;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g0Dkuf/h;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=frpi1aMT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n9Qb7Zv26gUhtCXZTzB8VxfwAxcPhk4AxUJPcz95PHE=; b=k6/iXWelscGnZGFcMB+6uHjvj2
	yew+xe6SzpfWOn1BfVKFCuCsLHqh8ilKd0ZgQ5YcHeb6igpk0mKILQY69paUn89hB4ZR/pV9SIkfJ
	7tQIEvvzh3lWDOQPzQGoiNJh0e0iiQ+S8/SwEPgQ/fPFBIOPzUfRySlYQ+gvSwVrKVs4iEG8NZSOz
	ggFexAxcU+GtUlh4wpEMqhUevM8GzPDLqAibYq6BWORqhJbgW2bLu89dP9m4I2KJ4oNVZPzQRGJgK
	RQ9SKkCK4ZMfqaBfZ3kM5CS17Qa+5cjIdSWFKuWwejpVC2wX50J3huFOQx1oXPhqsJCeLtZ/9E/Zu
	9G80llmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr1x-0000000GSFk-49Ae;
	Mon, 02 Nov 2026 12:20:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr1w-0000000GSFW-3klc
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 12:20:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n9Qb7Zv26gUhtCXZTzB8VxfwAxcPhk4AxUJPcz95PHE=; b=g0Dkuf/hALyAYdof3tMhKGtQD4
	YfrOaqbPxuLTvoj1x2CqCNm15RUX/IDM54ije+6WIle7LL3T3DVmZiGh9blBC+1sKMD7UujPY6YL5
	37nrPEayd7mtIYmGRDRL+FIeNQ87kJW5UfRLpo7/3yt6wHRjQHD46aa4Ty9HsKndBUHgLTZl8tH7g
	JK7I2hU2XzpTnx/Orv6d56jUW0L8v+HZ0CBR5GDSvXU4dg96mF2/Q54DjhZRMASTiZQuq7QkeTGOK
	YoDh6fFcZfOTylTKEesfS4p1dFxcetfzXJNd/WwqHWhDmAx2cwbSpz1++4D5TRpEaWFq3yLwoL2j8
	e2OoF63g==;
Received: from out-120.mta0.migadu.com ([2001:41d0:1004:224b::78] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr1k-00000002Ube-1QCQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:20:46 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=n9Qb7Zv26gUhtCXZTzB8VxfwAxcPhk4AxUJPcz95PHE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793622036; v=1; x=1794226836;
 b=frpi1aMT0grWOz2DbYDK5kmGCLFmpaykVNGiN2WrgYXCLoBU5dUH/2bclxmTXdfuGs7rU/Ra
 BieGWQQYhWKmT0H5/1NhlRj+8EKDcgbXXZxh9AVvQDzV5nncWOlVqgnFEfpYDAE95vt0RYufo3q
 2Ygcsh/hSqyBMESdnemx8aOg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 53f9424406099905;
	Mon, 02 Nov 2026 12:20:32 +0000
X-Mizu-Trace-ID: 53f9424406099905
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so7408e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 04:20:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzHf0lc7wj8C95R0JXHnQugDc8mLdVvjzXyliW4+SvL/tmVyQb40TjY1Tf7ZVgQe3n7lONd0/bidrjHiGtQZ41h@lists.infradead.org
X-Gm-Message-State: APuU4Z8ThFxxCV4YLxd93R49ehLtrBiy6mDWuLUHnBwEkjEdaGJcyKDM
	/rXhJF9xEgxm8llOHBf9/kWUfVpqRuY418dmC78fR5JffIeAjdkGLui2zWVnOGtrJuRrXexra4i
	uJXOMc8Wj9WLRUu1qez/ToFXCUtL6qrWvw/x/UBGV
X-Received: by 2002:a05:6512:67c3:b0:5bf:d238:4671 with SMTP id
 2adb3069b0e04-5bfd23846eamr373591e87.9.1793622031728; Mon, 02 Nov 2026
 04:20:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261102094748.2638468-2-ardb+git@google.com>
In-Reply-To: <20261102094748.2638468-2-ardb+git@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 2 Nov 2026 12:19:55 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwW9Pg+sMPOY49d9M5WLCM3Opz8ZBL4vBVqk9qJT9q0Nw@mail.gmail.com>
X-Gm-Features: AclHuK9zQLM777IMz9gaSa4k5VTfHhR4TDeMPA5ad8PHcF0LDzew-mhjZ3P0zAY
Message-ID: <CA+EHjTwW9Pg+sMPOY49d9M5WLCM3Opz8ZBL4vBVqk9qJT9q0Nw@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Don't livelock when AT can't resolve a fault IPA
To: Ard Biesheuvel <ardb+git@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_122043_983072_E7B77652 
X-CRM114-Status: GOOD (  10.92  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ard,

On Mon, 02 Nov 2026 09:47:49 +0000, Ard Biesheuvel <ardb+git@google.com> wrote:
[...]
> When a stage-2 permission fault doesn't report its IPA in HPFAR_EL2,
> __get_fault_info() recovers it with an AT S1E1R/S1E1A on FAR_EL2. If that
> fails, kvm_hyp_handle_memory_fault() goes straight back to the guest, on
> the assumption that the replayed access will either succeed or take a
> fault that the slow path can handle.
[...]

Tested on QEMU (pKVM with protected and non-protected guests, VHE and
nVHE, and page_fault_test) and on an Apple M4 in nVHE, booting UEFI
guests with DAMON_STAT on. On the M4 I added a trace event to the new
branch, and it fired once in 120 boots, on a guest write to the UEFI
flash (a read-only memslot).

Since a guest can livelock on this, I was wondering if it should be Cc: stable.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

