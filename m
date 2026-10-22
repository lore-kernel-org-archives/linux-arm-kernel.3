Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C64606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mg535E5Q;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Zpk3otvd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VXuE27163XQs95Y17MHXQoRtZevE9c0I3KUjJaU7M5M=; b=Mg535E5QpbqUdFcJjwBASi0DjL
	Wj8zxRAOUk9F4OaaCNlSkRE8yXjNeQps4YYbGzVO37eb4QSAhN9IPK0OI6Vx/BsKp8uQoIb4j5Uo/
	emF9emJjVe7UvxLlL1Vg/ysiO4bsEJacj9DfAsaZlmT5E/J/ew3DsW/APf9Grq1I/9rRwHcLlUHio
	IS5pJ6AlB47EX2qsypv3Ff/xQdrDDCZ8dQfS9bwjyeFzNI6E3nYazdT5C7xkj7/NU/apxNTrzpYln
	HjQcMfexd2xwdUfEPO3udSMrr9O50j7HOFi+WBavmq4tEbHOQCliob2YtHt4PG8fuGv7Npgi/fQHd
	v4rYxlfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwwp-0000000EeLn-1c7U;
	Thu, 22 Oct 2026 17:51:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJwwk-0000000EeKG-3k2j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 17:51:25 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e942864693so46665ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 10:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792691481; x=1793296281; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXuE27163XQs95Y17MHXQoRtZevE9c0I3KUjJaU7M5M=;
        b=Zpk3otvdf8B7tTCFtPbGpvNIz/dvDG5O1mLIlHzD8sPaSccQ0XaVJpHqkkSNYHMITd
         s1P3oJM/uA2XU3pX7TFnw/5Hx39fWrZcQpMaROAH3Pu3JvsY0ssGiQ7GUMxrcjPT2JGI
         Yh959XpkC6uvmxvLiBSbGrnIqUPzlyi2yISHzF2dHn8KMh/cMRe49Cp8RoDymZDP5D6A
         BvOxrAMNPZaRtgPasTQutYV8a7pCPV9RMCQSW38aeBPwvDaMADlTvyJyAvyajyXDt1qg
         Je4QszBoxKca+2MceBbqQbnTMhIm/q6/u/2NAquA99uBYt9bBAMMFHTXK03wrsV8dZrA
         FSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691481; x=1793296281;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VXuE27163XQs95Y17MHXQoRtZevE9c0I3KUjJaU7M5M=;
        b=gmNFYsl8zP/Ihj3y+KW8P8lQdzoQIazzyNBFSeDlmpk9XT2WFT9hWLfYgwuAWyFall
         vlDKlt/JFq8/jVZFI0AYUt9BG7rMwoC9X7rtRfh25K9MLsQZbMx0jRjHcJLvZBnAoeWx
         h+vnw+SS0ui3MiWXYf5a5BWTILa2g3FmSVdWfeYYywgnE7c/+vZHR4CYYTFbBBFvUuCa
         vPbjdccSgJLjI+q4BfOKK0FX+H9/bIJO6Z0pF/wlAEIdASrbH8LCJQkzqA41mFtxtpBa
         3rax2cQa2wbb5m8crZNvPTfg8FcnpiVDwWI57rHsBoCyCnXJ3zIlL6i4qxg/jdhpfZXW
         BElQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfjJzrjluO0xOB6BR2rBqxjcO222uHYZtK2aFpIDnioRJ9cv1qiyzUocNO3P86E2IRGtfTovnOLXzDuMDYz0Pg@lists.infradead.org
X-Gm-Message-State: AFq9FYJzIYwOXqZ9VWKHgHQ+4SPl1mIrGnrI0ZVvZk+qiOxFdHvbjC0j
	7r6XjSd9jqQZcPJd1ZOhf2T5boFfhonPSVk+tFaMYy++IsBtFRVUUXKQVbkYpmXPzw==
X-Gm-Gg: AYBFou3dCJtZnJa+Jj2UnHJHmIVkkrxRiwwAUdUBByoQAtxVv37F6Yg9yFeR6kEzYcE
	H7PeRdUSccfe3EYJTwFJQHMwYpGT/gUpID3tbi1yidgkb33nz+JBPCCTeQTQO0t4IpdzyyYr6SZ
	0wgVRnvii9DYqz+JBpXhyN6qQR3t417+UtRdDb9eBu7TfG7frHRa/RYKhhaYl5eoodBfHh7rKyI
	QJn7crDty0JpiyvT7PSe6TvDLbfftizqgE69Nax/uGJe/DmdcwTlAv/K3vtLLotsfDtTVulYJ6w
	Sw+ShFiz0MEYafYp8laXqEbfka5l2dRUf+DPH7xm6OHGZHR0dgubhXHqz4PfaFzjgFQpzkYIKQO
	hT2EVhAWkl4LciW5NCSNtBJ5P7KYTwFZvqqdOPCHJuslzDof9TQvgEZdbfxU/Sk5k1x7kadlTF2
	9aCU5yPJU1E8jeMbbsV8yk7sNDG94hijLKHUnmmWWAlYG9jqz7Ubi5GeK6Zv2BG/FT6QXdk7PuG
	4C0UJ/dG5SmsCXcnm0ZuFKdi7ScVMnNj61MwTXJwlSZK4/kg362S30tAWvp7fE55CUo492nuj7l
	AtIL+LwwR88cNnfl
X-Received: by 2002:a17:902:e547:b0:2e9:502a:ddbb with SMTP id d9443c01a7336-2ea43c9f6bcmr53298445ad.45.1792691480085;
        Thu, 22 Oct 2026 10:51:20 -0700 (PDT)
Received: from google.com (64.75.127.34.bc.googleusercontent.com. [34.127.75.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b346c43sm1644745ad.13.2026.10.22.10.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:51:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:51:16 +0000
From: David Matlack <dmatlack@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: tarunsahu@google.com, Andrew Morton <akpm@linux-foundation.org>,
	joro@8bytes.org, Mike Rapoport <rppt@kernel.org>,
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
Message-ID: <atpNFEFIlqAoYIwH@google.com>
References: <CA+CK2bAQbmq3ArP3XMErF_8RC2CUwvgpLY0H83D0nCJTaVKYyA@mail.gmail.com>
 <9huzecdi6go0.fsf@tarunix.c.googlers.com>
 <CALzav=dLdJoVy=B1pv0FAurD9OhAzLSTjJNbtjTdJRmSqaB0yw@mail.gmail.com>
 <CA+CK2bAQRMAEXZyHTEuUN0_Fo59Sn0hBmYbme_J9ewjx6gPyJQ@mail.gmail.com>
 <atlKsD-aJB3mJr2j@google.com>
 <CA+CK2bABt4OZO31TenVF2+uBUWVwViWbvfE00=0xbAw=f7K9SA@mail.gmail.com>
 <atl7peoVHdP5hz7z@google.com>
 <CA+CK2bBFXnJA1kddbLKGq0DAHDgjYhsTSQQay-xeX7jJC1V_UQ@mail.gmail.com>
 <CALzav=e=ho2gVrn+7KpZ3ZyasvH2u15-pC-RSRSS7KcMfKqUJQ@mail.gmail.com>
 <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bAJo8dnTOyKMgnnMnk-SCXbTsv+JCLEOWkjyj-wqtEkHg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_105122_997808_D0A6A0CA 
X-CRM114-Status: GOOD (  23.71  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-22 12:11 AM, Pasha Tatashin wrote:
> On Wed, Oct 21, 2026 at 11:53 PM David Matlack <dmatlack@google.com> wrote:

> > > #define DECLARE_LUO_SER(name, expected_size, ext_flags_count, payload_type) \
> > >     struct name {                                                           \
> > >         __u32 size;                                                         \
> > >         __u32 flags;                                                        \
> > >         __u64 ext_flags[ext_flags_count];                                   \
> > >         payload_type payload;                                               \
> > >     };                                                                      \
> > >     static_assert(sizeof(struct name) == (expected_size),                   \
> > >                   "LUO struct " #name " size mismatch!")
> > >
> > > For example:
> > >
> > > struct luo_memfd_payload {
> > >     __u64 pos;
> > >     __u64 size;
> > > };
> > >
> > > DECLARE_LUO_SER(luo_memfd_ser, 24, 0, struct luo_memfd_payload);
> >
> > This looks pretty reasonable but I would name the payload
> > luo_memfd_ser. The combined struct that DECLARE_LUO_SER() creates
> > should never be used directly since the offset of the payload in that
> > struct is only valid in the current kernel. So I would give that
> > struct a special name that makes it obvious you shouldn't be using it.
> 
> Lets drop the fourth macro argument and generate the combined struct name:
> 
> #define DECLARE_LUO_SER(name, expected_size, ext_flags_count)              \
>     struct name##_hdr {                                                    \
>         __u32 size;                                                        \
>         __u32 flags;                                                       \
>         __u64 ext_flags[ext_flags_count];                                  \
>         struct name payload;                                               \
>     };                                                                     \
>     static_assert(sizeof(struct name##_hdr) == (expected_size),            \
>                   "LUO struct " #name " size mismatch!")
> 
> For example:
> 
> struct luo_memfd_ser {
>     __u64 pos;
>     __u64 size;
> };
> 
> DECLARE_LUO_SER_HDR(luo_memfd_ser, 24, 0);

I think we are getting close, bu I have two remaining concerns:

 * Reserving bits in each flags word for continuation leaves gaps
   in the flag space that users have to know to skip.

 * struct name##_hdr only matches structs written by the current kernel
   (in terms of length of array and offset of payload).

How about this instead:

struct luo_ser_hdr {
    __u32 size;        /* Size of header + payload in bytes */
    __u32 nr_flags;    /* Number of features encoded in flags[] */
    __u64 flags[];
};

Each feature occupies 2 bits of flags[], so feature N is always bits
[2N+1:2N] of flags[N / 32], with no gaps:

  00: Feature not present
  01: Feature present, safe to ignore if not supported
  11: Feature present, must be supported by the next kernel
  10: Invalid

The length of flags[] and the header size are computed directly rather
than by walking continuation bits:

static inline u32 luo_ser_nr_flag_words(const struct luo_ser_hdr *hdr)
{
    return DIV_ROUND_UP(hdr->nr_flags, 32);
}

static inline size_t luo_ser_hdr_size(const struct luo_ser_hdr *hdr)
{
    return struct_size(hdr, flags, luo_ser_nr_flag_words(hdr));
}

static inline void *luo_ser_payload(const struct luo_ser_hdr *hdr)
{
    return (void *)hdr + luo_ser_hdr_size(hdr);
}

and bounds checking is just luo_ser_hdr_size(hdr) <= hdr->size. The
payload is always 8-byte aligned.

Payload structs are then declared on their own, with no header:

struct luo_memfd_ser {
    __u64 pos;
    __u64 size;
};
LUO_SER_ASSERT_SIZE(luo_memfd_ser, 16);

The static_assert covers the payload to catch embedded structs changing
size.  Asserting the header doesn't add anything since its size varies
by kernel. And because flags[] is a flexible array, the header can't be
embedded in front of a payload in a combined struct; it can only be
reached through luo_ser_payload().

I think the only downside is that the header increases to 16-bytes when
there is at least 1 flag. But I don't think we need to be so concerned
about an 8 byte difference...

