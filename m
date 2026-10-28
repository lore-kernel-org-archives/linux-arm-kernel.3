Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2129A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GJ3g/Hhn;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=jk0Z3EV4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s56cw49H74YOeay3n+CLmJxr96H3PjfrjsaPdtr6E80=; b=GJ3g/HhnayKzsPiSuRCxbYsD5A
	WBqagiju51LpJIkG5K+2JmkowHtMW5iY78l3nMs1lheTLsJOLT1FfLW5AS36hncN6+H86GFuAz0aJ
	cJRioNyWjREZM1UUkR4xq2B+AggUvI5dYuii8Ozdo7VBNg+OP9/3jXmcE6NZu7u6Y4pU1LrSFkIhv
	SIQ+LB8igrzOPD2r/5H0oOwZHOLt4dc24JZZ9Ce8OxKwzL3UBu/dRgB6LMhIEzeust0C2YfFkH1D+
	mYkNEjPPs1rA8azts6F0qgNwHiJF85lbBCFgJL5IDAeEX8YXTQW8VZMva6LrHJ//tj46WW5mtkcIh
	+/PlzcBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7hS-00000007h2O-1jFG;
	Wed, 28 Oct 2026 17:44:34 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7hP-00000007h1b-1Iv4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:44:32 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-99059bdcdeaso390702241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 10:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793209469; x=1793814269; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s56cw49H74YOeay3n+CLmJxr96H3PjfrjsaPdtr6E80=;
        b=jk0Z3EV4tWox4hZIsiJYeUSaaqVolMLBMEmV5leEe+ZfpkzJ1vXgWsiokUL6f7gSE+
         i2lvaBNrRnJqhgGY8R+GZNMicF54tvFRHoCSlZloYbFtseoRQ1LuRy7DZU3sodaXex1X
         5gjXqyo1tG1DvIdoNMzNxuhAvMKajEylrZpQjvAI5AfpliyM40YD2gcQwp78BAWp2paC
         afJyMeFSMVRbYNew/cn4bogEErSqQsk5uwiEhSqZlIkuTV3W/NxsbPlh5ZvNXV9Kgj+k
         7NfN3jV7ZwU3ccYDNNbm3mQkbftPFXBIfqqeC+8JOTGsCb4AjAEyUvUPwo0Q8aiEW65u
         eFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209469; x=1793814269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s56cw49H74YOeay3n+CLmJxr96H3PjfrjsaPdtr6E80=;
        b=QfIORFb35k+lRxFxRSU4u3QCNwOOFgQ/o4U/I+FIMnh2i7pIogX8hUwPtNcw7KiwqZ
         CDtyif5N0JjR6/yhS5ICQOFDgOP/cdg8y2LjyvWMWvAegt95wal+YTqYdEECw3nV4CO5
         zx2M+qaF+xQcnPVZcQ5y5VZZ+Yt2Ag0H31HkrrUs0LLyyrZTspFHTWNpkGvabtaf1vKu
         Fgz0yWt7OW5S3kyE1wuWMeCXCPVdRPjSjZnjJllQb+QJKAXtQqT++AH8ke+ubW4PPG+7
         RDT+qdg3CiKKKb0TFOrlGNikb0MIZ8jB03g3GJA52WQAYshjflZVeO9irenTAHJ0WYGo
         Ivhw==
X-Forwarded-Encrypted: i=1; AKwUvBxywDrcBEUAl8yFgBkY1+96Q9pPMqIAohJe72QIVYWXXhvScHSZ/uVXTmczdjz0a1rX4RYz68E9YeDRcvg0GXav@lists.infradead.org
X-Gm-Message-State: AFq9FYLf0bm9O0awF13SnkQoPrh7QIz86SNrsJs4SL1O40J86WR7lbj4
	nFuieCXfQYkdMJP4vOkunxPbv96sIrJTKMuRRdmmiIIuvG7ZZVZP7jQj/vkl88fH3eQ=
X-Gm-Gg: AYBFou3Zf8qI6V80JP7h3kr3KezbHURA45oVmUeKgyCFtICt4SkrtBmJocRvru1AFtJ
	9n87sb1EWV6mXSL5NvfYI0uC3heEHZB7WqNkI9ddNyiOCLz7IOukGMggxQGLnKYEBs9xeucNcn6
	TGMvNPYmoqALot3adf2o3j2xRX/Y26zxpJR7TQhX4BNRHpvziVQpq95ANPY4jTqLZDT7X2ADW2O
	VvKiBeSlXwK5nFG+j5RBmtoQ94faYsYokyLZ7zLNye49+GKikzDqtiYMgRpnmCs/9/F95sjTUVU
	KnRWsd+Iz2M9NwBgZm3jvdp7ioJ1EtPa6mBuDfRFt+l7/RjPijf+L9Fxc0zVOybfMD397CoGOFx
	osbrrszKnqU8ezDNhniJvy4U3OUmLFIvMeGv6GB9/GEYe4Pp4mIFK3kqySYRZiIITBrBZfjmIu9
	QKUm90vGFSiizj5uVrHbK6p8ccGKJUdsldrbzwZbmHKMoKLP9jmII73Bz+bP038DFBawYtH5nqp
	rpVJuFvUzVwN9JB5zAXvUO8xqmUM+BMs8oVjbrbeFsLnmlDUPCa8ZyPOrCSsZ/aFjQzfm3vOViH
	Hp5A5KEDHB5jE9P2Yx9ntmeoOVx1gr6BvQ+mlc4uMuJyTbm1R7ZR++X9sQucsJpmcDOm3njbvRb
	2s/djsAyvwF5XXqNQWrmkGoGUoChMpJll
X-Received: by 2002:a05:6102:3e8d:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7d03a50a85cmr1269510137.7.1793209468986;
        Wed, 28 Oct 2026 10:44:28 -0700 (PDT)
Received: from google.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99125931983sm6616412241.2.2026.10.28.10.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:44:28 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:44:27 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, tarunsahu@google.com, Andrew Morton <akpm@linux-foundation.org>, 
	joro@8bytes.org, Mike Rapoport <rppt@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com, oupton@kernel.org, 
	kevin.tian@intel.com, alex@shazbot.org, dwmw2@infradead.org, pbonzini@redhat.com, 
	seanjc@google.com, will@kernel.org, Alexander Graf <graf@amazon.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	iommu@lists.linux.dev, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	skhawaja@google.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
Message-ID: <auIvjVmWnsVPN_9g@google.com>
References: <atl7peoVHdP5hz7z@google.com>
 <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
 <atpNFEFIlqAoYIwH@google.com>
 <CA+CK2bB2C3Am5ssRuzYpfiU7_vB81vxMGc19HQLq7N=_7YrbTg@mail.gmail.com>
 <attmFVIFU_mS0Y7p@google.com>
 <CA+CK2bDXDWbww_d3sD6OZqpo37V1a3t76_ubbrXLQS=9DB3dWA@mail.gmail.com>
 <at-8vkVpN2SF3XgB@google.com>
 <2vxz8q3hoicx.fsf@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2vxz8q3hoicx.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_104431_365405_2019EF28 
X-CRM114-Status: GOOD (  24.34  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10-28 18:17, Pratyush Yadav wrote:
> On Mon, Oct 26 2026, David Matlack wrote:
> 
> > On 2026-10-25 04:38 PM, Pasha Tatashin wrote:
> >> On Fri, Oct 23, 2026 at 9:50 AM David Matlack <dmatlack@google.com> wrote:
> >
> [...]
> >> The reason I care about keeping the header compact is that we are
> >> defining a foundational kernel ABI and want to use this header across
> >> almost every serialized data structure so we can evolve them later
> >> without breaking compatibility. While some top-level structs are on
> >> sparse folios today, other serialized structs are tightly packed, and
> >> we are looking to add KHO slab support in the future where tightly
> >> packed allocations will be common.
> >
> > My intuition is we will have a small number of headers per preserved
> > file and per preserved FLB. One for the top-level struct and then
> > optionally a few more for sub-structs like arch-specific data. That is
> > why I am less worried 8 bytes per header, even if we fix the folio
> > problem.
> >
> > Maybe where our visions differ is when there are collections of
> > serialized structs, like KHO blocks. For collections I don't think the
> > elements will each have their own headers. Otherwise the elements could
> > be different sizes.
> 
> kho_block today doesn't store entry_size in the serialized payload. It
> relies on its caller to do so. With extensible structures, this can get
> messy. Sure, the owner of the kho_block_set can track the size somewhere
> in its payload, but perhaps we should store the size in
> kho_block_header_ser to begin with?

I agree, and we will discuss versioned vs. owned serialized data 
structures separately. With this series, we establish a common 
framework: size/feature flags and accessors, and we update most of our 
serialized structs to include them. All "shared" structs (e.g., KHO, 
FLB, radix-tree, block_sets, etc.) should have their own versioning.

kho_block_header_ser should have this header. 

Pasha

> 
> Anyway, not a problem this series needs to solve, but something we
> should eventually do.
> 
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

