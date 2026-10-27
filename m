Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A5E606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sNRt9ayl;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HmsO7bof
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PxRb990Xj/uwND6b4fXh9A/3T5i+xI2zB08D/68nqZA=; b=sNRt9aylqzrqDc9c78OQI3R/AG
	oFc+Eq3CSuuvO3xtV1EdvyVIpzDiGfW7W7euXgg741kHg09KlXqdxVcbNyWRC2HOXrzJubqY7/fTG
	HqIC3Chu8OVrKB/VGVph80j/y31J13kHOkdmKxeUGr1KlC7qX3umujbj6qYYgUVbOS4XfdjyeKmSF
	WwgVap6NhR0Rs+mxcLVbi5zFXDAMRrqqjvcIVp7Exc2LqT1F78zGx1YnhGOs337zjXDh2iEdFOg60
	u97exMxaG8WAFT3+DwfFGPtIQukD6zDr0DlHlA87xop/aG08qV6Rpcjk7Fs9CuPipHG/UbZpMfmrt
	9aKTdUfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjvK-00000005L8w-1aw9;
	Tue, 27 Oct 2026 16:21:18 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjvH-00000005L8C-2PMX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 16:21:16 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5eac4855401so48999e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 09:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793118073; x=1793722873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PxRb990Xj/uwND6b4fXh9A/3T5i+xI2zB08D/68nqZA=;
        b=HmsO7bofLpLzzYOQ+DvCciHyJr+cPRxf2AJ5rkdTo/mPGbf1CfgYnCtC6uKzpvPWsR
         FCb9XaS6NG45bmDjJHabexKXKHTw2CIfATLnBiP7ROf891a9jM8n5PiS5chIAc9wuL8z
         ZR13TOb5EAxaisCh8+qazbh3Vuy/woZB8zeVtiJ7+YozrjRYjyWs3QIe4/QRKkbydk7j
         /ov8e4PD579SYmvtNPOBhlIAB9EBcyfwX3nhcRt2wo4JGGWHdLPI2G2vG7gnEWAyCUqg
         VbhIEW5DRpno2tC9/2R4sI83a+ZjgB0d/ToU3KVbpOYGTbEHdomHAFooWJmVg5ouWIFq
         Q3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118073; x=1793722873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxRb990Xj/uwND6b4fXh9A/3T5i+xI2zB08D/68nqZA=;
        b=tFkKVKl4lBdWhFkBXuvuDxv5bb2dn4eXIGWYs/Y+4kcClUb/IqxZT5e9bfVsvGrqoZ
         Kxrk8xyk5SH4djYR6qqPfkY1YaebPLpTHtlGjDnniF0MjFHO1gALAOrB8D8dZ/cg8uRe
         Oh1sNn1miBUDLhV0iRmi8j6rDkiblmI7UoOb7HqOnCgBTUvB5lUTXOkxmuAfUoNTZUW9
         nACIA6pfyECR+Su/j1COlEsPcd0wTBGQMIZLKhuvLMkimqlZj3CBQpkpU1RoYY+o7x8C
         NZOpAxeLYmxrXOdPz+TD+vLLeyGdHhav3XjxZJiLIFXqL81RH3QPKQ2LvFBn2nQ2KdCS
         IUeg==
X-Forwarded-Encrypted: i=1; AKwUvBzkXHgGKbs16HK1IAc7AUPWM23bg2QYfx+trJZzGp0XFRSBctEtVNqS7Z018yyLSOCoWeCTH5zRia4/j8MmkPF1@lists.infradead.org
X-Gm-Message-State: AFq9FYLWfOVFjtDcAm5DBUnq1H61alosb0DGX46qlZtpkDahyHV/lkXg
	Q1rPhSaIX8816i92W7G2KTkO5OmUraHoLyn8hVlPfnBRWVz4pb0gmwVt/dpO36lwJGU=
X-Gm-Gg: AYBFou2iX4Syitx+AsomyMk1vi295BIKu6UdPnFMGOe3u4G4832nee3HFnyLJRHB4iv
	x59/lUleG77qqL2v6a9ElCfHh/jyrjSphZERn+3V5h4zAmzPPmsru0BtiPNLBhlxNgHKbeSsNQb
	ttQUtHCQ+41kclALfBNytwEkdh16jZ21AGhqhM1PVXzGoh6Mb0FNLEzCpV2Kppjd8BsZbCsnUfH
	CnlF6HuxcBU7FU5k6qivAHNCbRuQr87SROQcU/j2lLzCse66xDM/odvdzWSW3WJkManKL5z1HKl
	50MQ0/+dC517z0uBQTE7lWzJ25Rr5Z9cQUi2t2NDSRzcUY0+sKEH1OAYJ9LPnkjXWcrLDPQKvic
	1Xsaq9tOXqhB9bcSYKDV/2jYv2BimnRJ0iu4Qvs5RaNw6+T+YrjlV7XpU0knLJ9Uim8smlSQRiG
	7Xa+AZtnzXc8zzMYib4iTTmiVcAsFVxif7+0p+PjwyFJLbInjs2TMULTDBtbW5RqdEwdFvCOB4k
	ScBdnqMeIF0/uv8+DiYv98UZJD4FnmhAGyP8Mru2jPU5yWpNIJaqHMeVROw2r09p2+40EV2oNZS
	vRcluFiKNJyHUZW5X9g0tsURPCxvPswdyoDUqprNN1dSpEFa+7HLYSANFWa5+hFSVIHsDwTvfX4
	Ak/SjmPaFF2ZoybSu/cMtxyLpsAXJsw==
X-Received: by 2002:a05:6122:1352:b0:5c9:c60e:3a40 with SMTP id 71dfb90a1353d-5ec232e48ecmr4515149e0c.18.1793118073126;
        Tue, 27 Oct 2026 09:21:13 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec4a5f26c7sm304662e0c.9.2026.10.27.09.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:21:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:21:11 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Matlack <dmatlack@google.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, tarunsahu@google.com,
	Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de,
	jgg@nvidia.com, robin.murphy@arm.com, loganodell@google.com,
	oupton@kernel.org, kevin.tian@intel.com, alex@shazbot.org,
	dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com,
	will@kernel.org, Alexander Graf <graf@amazon.com>,
	Bjorn Helgaas <bhelgaas@google.com>, baolu.lu@linux.intel.com,
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org,
	sagis@google.com, linux-mm@kvack.org, kvmarm@lists.linux.dev,
	iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 3/4] liveupdate: Replace compatibility string with
 a 2-bit pair feature header
Message-ID: <auDPd6tjzACQVszf@google.com>
References: <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
 <atl7peoVHdP5hz7z@google.com>
 <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
 <atpNFEFIlqAoYIwH@google.com>
 <CA+CK2bB2C3Am5ssRuzYpfiU7_vB81vxMGc19HQLq7N=_7YrbTg@mail.gmail.com>
 <attmFVIFU_mS0Y7p@google.com>
 <CA+CK2bDXDWbww_d3sD6OZqpo37V1a3t76_ubbrXLQS=9DB3dWA@mail.gmail.com>
 <at-8vkVpN2SF3XgB@google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <at-8vkVpN2SF3XgB@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_092115_658756_72BD01C5 
X-CRM114-Status: GOOD (  17.22  )
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

On 10-26 20:49, David Matlack wrote:
> I still think it's not advisable to define name##_wrap since anyone
> could accidentally start using it on the incoming path and we wouldn't
> notice at first (especially since same kernel Live Update tests would
> keep working totally fine). I also don't think asserting the combined
> size buys us anything. The header size is just a function of the
> number of features, and what we are trying to protect against is
> structs embedded in the payload changing size.

Fair point.

> 
> So I would just do:
> 
>   /* Marks struct name as a KHO serialized payload with a kho_ser_hdr. */
>   #define DECLARE_KHO_SER(name, payload_size) \
>           static_assert(sizeof(struct name) == (payload_size))
> 
>   DECLARE_KHO_SER(luo_memfd_ser, 16);

My main requirement is that DECLARE_KHO_SER() in include/linux/kho/abi/ 
must be enforced by the compiler rather than being just a bare 
static_assert() that someone could forget to add. Since kho/abi/ headers 
contain both versioned structs and unversioned sub-structs, it must be 
mandatory to declare versioned structs in kho/abi/ with their 
static_assert size check before the kho_ser_*() helpers can be used on 
them.

So, how about adding enum names like this, that are going to be required 
in accessor functions later:

#define DECLARE_KHO_SER(name, payload_size, nr_feats)             \
    static_assert(sizeof(struct name) == (payload_size),          \
                  "struct " #name " size mismatch");              \
    enum {                                                        \
        __KHO_SER_SIZE_##name = (payload_size),                   \
        __KHO_SER_NR_FEATS_##name = (nr_feats),                   \
    }

> Plus helpers that allocate and initialize the header and return the
> payload as a typed pointer. Both the outgoing and incoming paths find
> the payload the same way, by computing its offset from the header,
> rather than through a struct with a fixed payload offset:
> 
>   /* outgoing */
>   hdr = kho_ser_alloc(luo_memfd_ser, LUO_MEMFD_NR_FEATS);
>   ser = kho_ser_payload(hdr, luo_memfd_ser);
> 
>   /* incoming */
>   hdr = phys_to_virt(args->serialized_data);
>   ser = kho_ser_payload(hdr, luo_memfd_ser);

These would become, where without enum, the init would fail:

#define kho_ser_init(buf, name)                                     \
      __kho_ser_init(buf, __KHO_SER_SIZE_##name,                    \
                          __KHO_SER_NR_FEATS_##name)

And payload can also check the existance of DECLARE_KHO_SER, using 
(expr1, expr2):

#define kho_ser_payload(hdr, name)                                  \
      ((void)__KHO_SER_SIZE_##name,                                 \
       (struct name *)__kho_ser_payload(hdr))

We can also add an optional kho_ser_alloc(name) to allocate, init, and 
preserve.

