Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1083E606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 17:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zpQ1YvMl;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=ObzTRRDk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elbAOUhGKDzUinaTQ0302ZCYZ7inGoSdWd2JTt/hv+g=; b=zpQ1YvMlaw+B/tDAZy1yoyI70B
	PIkA+FwX5hJZCoDH5xCODaXYOBMAL2rhyYEfzx+vozFmomeuWgi5PEDhrK3l8zwZpTik8UEWTdr46
	Qbn0i7SaJzI052BXemV7tFSG77ykxQE+bBDWSIROyIbM0G3YMPVFUbo2b/kpZZFRvC5tNOlm/6HJI
	fnZlaMBumWR86htmkwXAE5G8ARsgBQlOeN+enTPEquMQHdGmrl6raePXsVaw0J2fpRbhrZY46HfvF
	hMvlfk2YcVRn5rCxkoeCZi6n0QSmknmgYZ9XXMX3nG1gpgzLr91XH2o6Av5sNLdfjEwfmZI/hpzw5
	zngUo/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZww-0000000CXKp-1LrB;
	Wed, 21 Oct 2026 17:18:02 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJZws-0000000CXJV-3H6Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 17:18:00 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c4322d310e7so134156266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 10:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792603077; cv=none;
        d=google.com; s=arc-20260327;
        b=YN1f0cANNrVrJxINxDRHAB04nswIT/TTPLZRrb7NbymGZ9x0HFrsmVh7QxmbzdzGqT
         oy1oF0uM4r++oFBMSClWl8BO63NB4TX6X07mDgNLrObyAoI3cc12uRi8BSZKJ1k3Zo+t
         ZWB4sYf5j2oeJav7xpemHNK7c7OM1F6IlNEbYqUduEfhOt6hjT4yIGEp7uMTYFjnNvaT
         xAOsSonG2DwFz2hFlmmqCZx1wQCub72GDsYMI0w4yttLf1H2G0EHS8piTjq/ne8RPr7F
         B9pPXVNk6UWs2zCpXf0LBkF8aT2RDpahmizL/ND7QQrepZ2e7KQ6uJovmDTIMVmaUlJq
         UpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=elbAOUhGKDzUinaTQ0302ZCYZ7inGoSdWd2JTt/hv+g=;
        fh=lzGpbeDj8r54ELARuzi1nLzhH00iv54zttqOZrMNsqg=;
        b=FiDdPsNZFaMrmVzf/tFG5hEuk/FKv/xdfnUVnhlaETQ3cKGIRN+f1v4e/boyzSGp9R
         Wl1/Jae8zkRge7NpYJwO4r+y06b8aqSMqpIUTxvjIINThdRU2atkhAonuz/U/IKFYd9f
         zZB7DYKWRFmROHJe5skcE7b0GJg+HGlLSFLJKJHLJzlzOQawmAPZyz0mq13oUPchKdf4
         2UXMYiA+wt4q5hCVDGf+V/BoXi9q369sAiuMAgsH0ZPe8JPYBhpeCi16miRtg4Mbj+xn
         6Ybdj5XYxDBmCV1+1Xc4H2LoBfuMNAHr92oeeqX4+W76GHMdJWyUuwJVcDyNlSNnu2I/
         DcHA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792603077; x=1793207877; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=elbAOUhGKDzUinaTQ0302ZCYZ7inGoSdWd2JTt/hv+g=;
        b=ObzTRRDkCvX+leRLl0LWibecMFebyxX93xwwRwdjTG+Ha7EKU6PqU5bFw1hKa0Jfdk
         GVk8bxD0qpMw8ZdAx5q04evqfhWlWEs+AgNCYwL/i0uhHvVPOzYg6aqUa53DUyZLWiy6
         IrdUMrWz5+Pki8eU2xX5JmDxrOOOd7n9VPyma1aWjhYGtRXFp1zaFpWrcJUrweHvOzNT
         M/af7NE8qLTpuBkRNXwuKFLipT5CGl2jzT7EYUmyh8FrejsSraJab9MdZuKSPIz39REe
         PNUWFSJVqfnxgd9/JAJ+PYIrTtF0xjtX2cKOYt4cWHlYJlVuccObGOHabKiv62udYkdi
         F+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603077; x=1793207877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=elbAOUhGKDzUinaTQ0302ZCYZ7inGoSdWd2JTt/hv+g=;
        b=GJFJp24d1O2ywAwwsz09lhSne20BnKKuW9VJw9m08LmfJxqWeoy+McM7XqRVAgry6F
         hdzC61uTXxDwV4qMVJdUXn27F1VEPtaBCWMVLLgGEpqh+y7opmTlXv6htzmjvkCu7q6D
         lep+U4cd1756sGVc6fNkXIZArhRteWLibNK5VLjQdKAjTRpf2C74HY6pl3m9XXGjB0ph
         KrXJT8lGDpdfVl1tBgTpW5OgAqIek5ciMEAidctVQ+uiarZDeupBzJF5IrlTimPIllAT
         c/sM6ih774Xe1jk5hq09xKDRbycmHIEwcaE51YW6jnwKCtLPCEyVTUTamvPyduZYpFZV
         D7Ig==
X-Forwarded-Encrypted: i=1; AKwUvByzUqkOBCWZ2rRyU/SsOdS++kQ2YF/twYyDOT7zyhMzcmqho+MnwReUXh/VRJr6wIXXLNM3llyp2pn5l846BNSs@lists.infradead.org
X-Gm-Message-State: AFq9FYKSF8vEjaRwqmGrUKd6y2OKKySePvQnJqpOa0fSh8bRKIouH9wE
	e1LrrB4u9t81LLXCUn5I4Pa4LRSciwCDbKnlk/W88cywzUrCbg6Ojf23YmLQvZkkNI6e2d+uP1l
	AKpZdxo+MDeBxLbkoErYdk66Gzz3cDg4vHpSxKVc8Cw==
X-Gm-Gg: AYBFou0YDYtvJq9sBWtc44yByazRXP+DSr8+d3ShCVUnusDik7QsyCirfbBR/kH2s2U
	kG+I8wmfqdERySUIcq5XgctulH4Mr34wvPhwnIroPdqZ7FxyGLsL9/nCrVJeSm7ipPRD4slVJRp
	TNU0KMAl0DEPyIoQQP+5XHucel+6IGQKvyGU5MvOiAF9iLX2KA0FP6FfEeovpSPWUlcGqqzw0eM
	ThiOV1dHNb/iSzTvYVLU1aRpzblluM/2C5A8XvBdMUtdRQY57BLhBxVHpGYM/JhOAjA76MLamiO
	MQlmmdlVj3HwI+2JJupkXzTyU8sUXyQuN4KCtRQ+DK6wRG7GTxd/yH9HmRiBV0KmOx6kIVFqXHS
	T7yTzje1I2JsCj6Qyxfgm7fBmBK0arqMHGSH21Zq1CivuY3icczc3h7HRrCndTCdW8pA=
X-Received: by 2002:a17:906:f597:b0:c3e:f39b:2286 with SMTP id
 a640c23a62f3a-c4678f7c6cemr225893866b.0.1792603076743; Wed, 21 Oct 2026
 10:17:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021152527.375070-1-tarunsahu@google.com> <20261021152527.375070-3-tarunsahu@google.com>
In-Reply-To: <20261021152527.375070-3-tarunsahu@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Oct 2026 13:17:19 -0400
X-Gm-Features: AclHuK-IkiswuL9j-om2-Yvi6ZhWxvxntziJi6QKVuLB1ELR4YcI0vWO7hzjpeA
Message-ID: <CA+CK2bCnS8wcVDbOymBGeJB6pDUkknOpF22EynbwSV=D5=J4ow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/4] liveupdate: Select file handler by name in the
 preserve ioctl
To: Tarun Sahu <tarunsahu@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, joro@8bytes.org, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, maz@kernel.org, arnd@arndb.de, 
	David Matlack <dmatlack@google.com>, jgg@nvidia.com, robin.murphy@arm.com, 
	loganodell@google.com, oupton@kernel.org, kevin.tian@intel.com, 
	alex@shazbot.org, dwmw2@infradead.org, pbonzini@redhat.com, seanjc@google.com, 
	will@kernel.org, Alexander Graf <graf@amazon.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, sagis@google.com, linux-mm@kvack.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	kexec@lists.infradead.org, skhawaja@google.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_101758_877598_222FA717 
X-CRM114-Status: GOOD (  37.87  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 11:25=E2=80=AFAM Tarun Sahu <tarunsahu@google.com> =
wrote:
>
> Currently luo_preserve_file() iterates over luo_file_handler_list and
> picks the first registered handler whose .can_preserve() callback
> returns true. When a subsystem introduces a new, backwards-incompatible
> file handler alongside an existing one for the same file type, userspace
> has no way to choose which handler preserves a file descriptor, nor can
> the kernel keep the existing rollback-safe handler as the default while
> allowing callers to opt into the new handler.

That is not how it will work. If we are in the .can_preserve() call,
it means the user has already decided which file handlers to use. We
need to do that before any preservation happens; otherwise, we could
run into conflicts on FLBs i.e. FH of different version require
different FLBs.

Therefore, there should be a luoctl call (i.e via a new ioctl to set
compatability) that provides the kernel with the specs file of the
target kernel we are updating to, allowing the kernel to select the
compatible file handlers. Since .can_preserve() is called when the
user is already preserving files, the specification must have already
been supplied, or the kernel should fall back to using the default
(i.e., latest) file handlers.

>
> Append char handler[LIVEUPDATE_HNDL_NAME_LENGTH] to struct
> liveupdate_session_preserve_fd immediately after token, keeping
> IOCTL_OP min_size at offsetofend(..., token) so callers passing the
> original 16-byte structure continue to work:
> - When handler is empty (all-zero, or zero-filled when userspace
>   passes the 16-byte structure), luo_preserve_file() selects the first
>   registered handler whose .can_preserve() callback accepts the fd.
> - When handler is non-empty, it must be null-terminated within
>   LIVEUPDATE_HNDL_NAME_LENGTH bytes (returning -EINVAL otherwise);
>   luo_preserve_file() looks up the registered handler with that exact
>   name (returning -ENOENT if unknown) and verifies that its
>   .can_preserve() callback accepts the fd (returning -EINVAL if not).
>
> The retrieve ioctl is unchanged because the handler is identified by the
> name stored in the serialized payload from the source kernel.
>
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
> ---
>  include/uapi/linux/liveupdate.h  | 12 +++++++++---
>  kernel/liveupdate/luo_file.c     | 21 ++++++++++++++++++---
>  kernel/liveupdate/luo_internal.h |  3 ++-
>  kernel/liveupdate/luo_session.c  |  7 ++++++-
>  4 files changed, 35 insertions(+), 8 deletions(-)
>
> diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupd=
ate.h
> index 509c6236720d..2413b19dabc1 100644
> --- a/include/uapi/linux/liveupdate.h
> +++ b/include/uapi/linux/liveupdate.h
> @@ -126,9 +126,14 @@ struct liveupdate_ioctl_retrieve_session {
>
>  /**
>   * struct liveupdate_session_preserve_fd - ioctl(LIVEUPDATE_SESSION_PRES=
ERVE_FD)
> - * @size:  Input; sizeof(struct liveupdate_session_preserve_fd)
> - * @fd:    Input; The user-space file descriptor to be preserved.
> - * @token: Input; An opaque, unique token for preserved resource.
> + * @size:    Input; sizeof(struct liveupdate_session_preserve_fd)
> + * @fd:      Input; The user-space file descriptor to be preserved.
> + * @token:   Input; An opaque, unique token for preserved resource.
> + * @handler: Input; Optional null-terminated file handler name (max leng=
th
> + *           %LIVEUPDATE_HNDL_NAME_LENGTH including null terminator) sel=
ecting
> + *           which registered handler preserves @fd. If empty (all-zero,=
 or
> + *           omitted when passing the 16-byte structure), the kernel sel=
ects
> + *           the first registered handler whose .can_preserve() accepts =
@fd.
>   *
>   * Holds parameters for preserving a file descriptor.
>   *
> @@ -152,6 +157,7 @@ struct liveupdate_session_preserve_fd {
>         __u32           size;
>         __s32           fd;
>         __aligned_u64   token;
> +       char            handler[LIVEUPDATE_HNDL_NAME_LENGTH];
>  };
>
>  #define LIVEUPDATE_SESSION_PRESERVE_FD                                 \
> diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
> index fb81239bedf3..be20e0f1e0aa 100644
> --- a/kernel/liveupdate/luo_file.c
> +++ b/kernel/liveupdate/luo_file.c
> @@ -207,6 +207,8 @@ static bool luo_token_is_used(struct luo_file_set *fi=
le_set, u64 token)
>   * @file_set: The file_set to which the preserved file will be added.
>   * @token:    A unique, user-provided identifier for the file.
>   * @fd:       The file descriptor to be preserved.
> + * @handler:  Optional NUL-terminated handler name. If NULL or empty, th=
e first
> + *            registered handler whose .can_preserve() accepts @fd is se=
lected.
>   *
>   * This function orchestrates the first phase of preserving a file. Upon=
 entry,
>   * it takes a reference to the 'struct file' via fget(), effectively mak=
ing LUO
> @@ -238,11 +240,13 @@ static bool luo_token_is_used(struct luo_file_set *=
file_set, u64 token)
>   *         -EBUSY if the file descriptor is already preserved by another=
 session.
>   *         -EBADF if the file descriptor is invalid.
>   *         -ENOSPC if the file_set is full.
> - *         -ENOENT if no compatible handler is found for the file type.
> + *         -ENOENT if no matching handler is registered or accepts @fd.
> + *         -EINVAL if the named handler cannot preserve @fd.
>   *         -ENOMEM on memory allocation failure.
>   *         Other erros might be returned by .preserve().
>   */
> -int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
> +int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
> +                     const char *handler)
>  {
>         struct liveupdate_file_op_args args =3D {0};
>         struct liveupdate_file_handler *fh;
> @@ -266,6 +270,18 @@ int luo_preserve_file(struct luo_file_set *file_set,=
 u64 token, int fd)
>         err =3D -ENOENT;
>         down_read(&luo_register_rwlock);
>         list_private_for_each_entry(fh, &luo_file_handler_list, list) {
> +               if (handler && handler[0]) {
> +                       if (strcmp(fh->name, handler))
> +                               continue;
> +                       if (!fh->ops->can_preserve(fh, file)) {
> +                               err =3D -EINVAL;
> +                               break;
> +                       }
> +                       if (try_module_get(fh->ops->owner))
> +                               err =3D 0;
> +                       break;
> +               }
> +
>                 if (fh->ops->can_preserve(fh, file)) {
>                         if (try_module_get(fh->ops->owner))
>                                 err =3D 0;
> @@ -274,7 +290,6 @@ int luo_preserve_file(struct luo_file_set *file_set, =
u64 token, int fd)
>         }
>         up_read(&luo_register_rwlock);
>
> -       /* err is still -ENOENT if no handler was found */
>         if (err)
>                 goto err_fput;
>
> diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_int=
ernal.h
> index dac6644bfb18..911ffedec9f3 100644
> --- a/kernel/liveupdate/luo_internal.h
> +++ b/kernel/liveupdate/luo_internal.h
> @@ -101,7 +101,8 @@ int __init luo_session_setup_incoming(u64 sessions_pa=
);
>  int luo_session_serialize(void);
>  int luo_session_deserialize(void);
>
> -int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
> +int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
> +                     const char *handler);
>  void luo_file_unpreserve_files(struct luo_file_set *file_set);
>  int luo_file_freeze(struct luo_file_set *file_set,
>                     struct luo_file_set_ser *file_set_ser);
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_sess=
ion.c
> index f48e9a4185f9..194ef45907c1 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -266,8 +266,13 @@ static int luo_session_preserve_fd(struct luo_sessio=
n *session,
>         struct liveupdate_session_preserve_fd *argp =3D ucmd->cmd;
>         int err;
>
> +       if (strnlen(argp->handler, sizeof(argp->handler)) =3D=3D
> +           sizeof(argp->handler))
> +               return -EINVAL;
> +
>         guard(mutex)(&session->mutex);
> -       err =3D luo_preserve_file(&session->file_set, argp->token, argp->=
fd);
> +       err =3D luo_preserve_file(&session->file_set, argp->token, argp->=
fd,
> +                               argp->handler);
>         if (err)
>                 return err;
>
> --
> 2.56.0.212.g129ede20d9-goog
>

