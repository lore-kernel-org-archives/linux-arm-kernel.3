Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93613606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 08:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LW/Bb/7w;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NNkk+l4E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L5HnUNLFXRQf/6dxLPFNXYLFL4knAlxUvl8n9LuSkpg=; b=LW/Bb/7w2rC6kZ
	E3tP8NR95VHCQdhOVgmsjHndwwzaTgicw5jaOTt42hpSocl2i5Parp4D427REYzkiW4AE9f48alOC
	1YtS4phLx1L7lSgPS3u9t5uG26VSaP6oQcGOLD9Tl6TazoTb0n1cUY/9gGJcYmP4U88k7VzAqmb0A
	h1A/wxmXycGKRHdP7i7vTa8JR4PE+FG9ZWSt30Deqg1tBMRnCTrf3sAuLxOZDpOBnjiHFLVTyWYwD
	kKuYJztrs9PNQmj2jJd615TEx0lVHyuWXcRE9rELVqhVWVXVgO7NKzrppRmotzSYNBd6p4K6xqvz5
	C4hXkGQd1btXB3Fi1AiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtsL-00000000tfM-2fjh;
	Sun, 25 Oct 2026 08:46:45 +0000
Received: from mail-dy2-x08.google.com ([2607:f8b0:4864:36::8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtsI-00000000teQ-3zys
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 08:46:44 +0000
Received: by mail-dy2-x08.google.com with SMTP id 5a478bee46e88-3537f63c9e6so926441eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 01:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792918002; x=1793522802; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L5HnUNLFXRQf/6dxLPFNXYLFL4knAlxUvl8n9LuSkpg=;
        b=NNkk+l4EHBrHfEl6CSnSSuk4dSjWS12QOG3ngqRzYy+TU6NZUwvdZ3qxWBYzQHmQS9
         rJ+qzHtYWPf0/VQuP22qsEItsvz9r8ZQ/v8YvC4jkR5VkVlwxZ+MBJuvnZ1HvXxJyMfm
         ykKOExbKjPsSKNclcTlnX/2hnmCbNoArKPd/9tNxx7L5Ith5BsgeSF7sg2ntw7656d5G
         KcaqYE1Xd0syIQ9hnsoYjuO4qXlrNZXEqWqJUN6Dn2nWzYCfqq0zokhYT73XtQw4bDO6
         LwgbTTq4xThg6//tz9Eex+aEJeFMFTSg1DkrN86MAQXp+E8Cmj0LPJyynfsy9k3uKyGR
         EqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918002; x=1793522802;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5HnUNLFXRQf/6dxLPFNXYLFL4knAlxUvl8n9LuSkpg=;
        b=gV4Ppf2WH7Q+Aiz4UsqV2uOGxzbc7NS+oDGiskh8IntcbYglQcsABOaiQGvX8foyN7
         bvTnQLLDhh0OytJk1YkbHrIDFunmC7vXiRzvU6sGO+uq8Zw4EJw10LOV64gKWlYsSSvJ
         wB3U2ConThxjZVCVMQ9oT6WQ4DhM6N2d5dKak3jD46cYurZALwDiftkX66QtzV2YhWo4
         F3UNG+zpGQQBBTuvjnkNj2zcL7XLXo6X9mTWPEQRCKAyk+Z8RaV8LqsBzKsnhngaUIFC
         sq25sNXt7HHc++V/eCyXnhhh7v1DWePn7+uroOEeRng1cnJpS25gtPb6zqtTYXn16BYe
         Pi1w==
X-Forwarded-Encrypted: i=1; AKwUvBzNwWk+cSIZnIH1fJ03WkXF82SR8vHUhHWFiwoL+3oqn/3Je04Kd+MOU2yOeM5jFGitThy2hv9JK+KDOKSo2rTq@lists.infradead.org
X-Gm-Message-State: AFq9FYKvaCDjX0TYHYakl5wlg1ia8dEQTQ6FS23yYX2HfDsWvudCeRpu
	Qc8AyolQkW2Lg4PLigA6cjaxnLsgAvwmdMaaVaLPMrtdPwqLmm4kGbwpZpx+EDYQ6h0=
X-Gm-Gg: AYBFou1JcYUPGr43GuSTY8YRB5ZTC9bBv4xgRtIjNUGui6Oxxukp9SxFEJmB8HMW7eM
	6ef8o0iRweL4DMS5UgaTlaJ8hid7h/AyiLf8dPqUtS4ELACK1Jq9XnSd5YRxb/K/TCLmsLygySD
	W3PmcZzj0IRSOvEKh5RB7E2nz3AXG4UXv6rkX0xJ7liUwUEKlqxMtCgykFjRklTLtpojRoGXBo6
	/03HEtPip5Ee4A3/HcFMThqYQ9WjqXKbDyHXlH5AdKTLUePytUwAR7A+0uARGgqqn0VBH/CELip
	KMAKdax1ft2eWcYWqh9EILKRMqrKaerzqTr6nKOqKTNGpEKvSja9ogQOqnF4VYhZz2Fj7nABNCd
	SjCF3WBXB+xA52R2eCOgX5fALNPQ/MqYffm5cOgUhsyJXXaw4UQ5bME4vQZ481sUtYoytYRMd5+
	huCXydd4fRHc6goDwEr6WjDFT7v0wwaftcEcLU9yU4AaIvZmj6DnBJClgo+J0Hf16xW/6qSR+VY
	xUYbrBYDcVluZF5HG5/SkoKmprZ9KCyCfxif1TqrvElPNLWKh5IspyqA+ZQuSyjKA==
X-Received: by 2002:a05:7300:8aa3:b0:369:b82b:5fb0 with SMTP id 5a478bee46e88-369e84ac218mr5762198eec.23.1792918001511;
        Sun, 25 Oct 2026 01:46:41 -0700 (PDT)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm24418092eec.25.2026.10.25.01.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 01:46:40 -0700 (PDT)
Date: Sun, 25 Oct 2026 16:06:39 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Roger Lu <roger.lu@mediatek.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_soc=3A_mediatek=3A_SVS=3A_fix_devic?=
 =?US-ASCII?Q?e_reference_leak_in_svs=5Fadd=5Fdevice=5Flink=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <fa60e7c4-d8ca-4ff4-a56f-6a6e2bfbf3cf@web.de>
References: <20261023082948.1854252-1-coiaprant@gmail.com> <fa60e7c4-d8ca-4ff4-a56f-6a6e2bfbf3cf@web.de>
Message-ID: <9AE974CC-F342-42F0-84A3-D72C3A0326C2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_014642_991084_78C39177 
X-CRM114-Status: GOOD (  11.36  )
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
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On October 25, 2026 3:58:06 PM GMT+08:00, Markus Elfring <Markus=2EElfring@=
web=2Ede> wrote:
>=E2=80=A6
>> Drop the reference before returning on both paths=2E
>=E2=80=A6
>
>How do you think about to increase the application of scope-based resourc=
e management?
>https://elixir=2Ebootlin=2Ecom/linux/v7=2E3/source/include/linux/device=
=2Eh#L1363
>
>Regards,
>Markus

Hi Markus,

Thanks for the suggestion=2E To be upfront: I'm not the maintainer of this
driver, I just ran into the leak while reading through the code and
wanted to send a minimal fix=2E

__free(), DEFINE_FREE() and return_ptr() only appeared in v6=2E5, while
this driver dates back to v5=2E19 and the fix is tagged for stable (first
LTS is v6=2E1)=2E Converting to scope-based cleanup here would not compile
on 6=2E1=2Ey and would force the stable team to rewrite the backport=2E

So I'd prefer to keep the explicit put_device() in this patch and leave
the __free(put_device) conversion to whoever owns the driver, as a
separate cleanup when the stable backport is no longer a concern=2E

Regards,
Coia

