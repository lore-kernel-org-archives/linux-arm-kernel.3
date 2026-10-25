Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D054606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uDJ45AsD;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jYqlSEpV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KLQlagsRKAQ2szx0aaP3EES/xqizR2EBTnrR9DEFR+8=; b=uDJ45AsDW91GP7
	dzRHJrYnhUstP4UD7JL6uQwRtnSgnbXWVAf+O3MdbjexB6V30Y6J/1Lt2um5C87i75nOqnUW9o0BL
	L7AS6NwvZ0B2k6SLp5brVKxgPIBVGaTEJpAq4DnfpywLrZRmigLO/7FQf22K/KKcqAvltoxVWQn6T
	ZePLZXgUyK7pjRAHjheFGVvYtH1JX2JltGFHzd9MKNRp5iIWdwjJtTZg3Oug6GWdKD+oU8UJqDxGB
	Hl765oTEpEufGGaJr7PK1s0vMcf5EXhy/LhGWLqDUvjd+iZv6Tm03Hst/ui/DJ/KytIRAiX1ihlxM
	v27T6DbTS6Ty9DRiOuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKwga-000000010x8-2IRI;
	Sun, 25 Oct 2026 11:46:48 +0000
Received: from mail-dy2-x09.google.com ([2607:f8b0:4864:36::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKwgY-000000010wH-2Zim
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 11:46:47 +0000
Received: by mail-dy2-x09.google.com with SMTP id 5a478bee46e88-35cd538de29so1132667eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792928806; x=1793533606; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KLQlagsRKAQ2szx0aaP3EES/xqizR2EBTnrR9DEFR+8=;
        b=jYqlSEpVKwxqXkwwuREiAiiipo57vfCewBd0UXI39iGElIAMEBN1mNAUrPyy7vN1vR
         RaW2Q6Ygeree5Nlogfp9v56v+d9kPN3T+NP/R0gFaIPrjEmvG/RFiPxTJBGOqBkRBU8O
         V3fiDh5f4syyha8Mbub+ZpS6aPY2fj/VUvC3QSlWTfWIJuaMdIsthMNQGgJvBW6qRaX+
         N11vDtfKgG+ia5zM55rE+D52XaxfiwqBEz27OeuYRZwPf4T3yQ/zrRU0kpXa/XVtzPqJ
         Ow479f1dx++AkArFVQ6LfSEyRwutCFMd1b0A4hMxDl2ubiQNUnv5nrr7JXKOE4YmcZQq
         CfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792928806; x=1793533606;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLQlagsRKAQ2szx0aaP3EES/xqizR2EBTnrR9DEFR+8=;
        b=UqtXP30cwa7KxbxMAoAgbez+Raw285z88FCl+jMRo2cpXwl69uDyKChXxpj9g7MagR
         IlFHgkL8Aq9/kOs5D9CFmXYn9dN6Vr1n5GhAl6UF3Yo++B3en99viO1mg/mWlUjj2ccR
         C9wdp56QbehEFgH5DNIY4DCIhiz6TIGXJ/LHkX8Ks3MfIPI+2uGsImTk+/flKsa1IEVD
         zUmQDOWYWrV1TdgQpCttRIiCj3uVoQmtmX8h1F5FSWCp6AE0SNLDdPWw+SxlcWuJBeH+
         TcWzkaz2h/yZEdauPb5u2TtplNgkOrhny34XZ2ksu4ofXq84oAVLG/7OkJH5KokrpHB+
         Di7g==
X-Forwarded-Encrypted: i=1; AKwUvBx5px70BsRuK1HRyL+A90cXuXwHMt2Cz1X4EsGeD6XZZXYKz9HKDsLdlIn487EEJst9z6GhgFswyziBo02J2tn+@lists.infradead.org
X-Gm-Message-State: AFq9FYJZJeHRipuJkg2utOzvbzdPK7HA5xRuAy9fInMbKqwa7aCKeRG9
	0K1DvkTyyonpnGNTePEjIX0VE7ew7jjq6wxkMIm68lwOMtwsmeNkz3l7
X-Gm-Gg: AYBFou1tm3vztn7hUM+TTafuz+RA77X/xdD7ruzHb/2SrY6p/0CwppHThPVEQJToTPL
	FQEK/ju0OXz4LM+ZCHACn56s4mMnPM2EnsV4RDxDLhH+ixbx+UTRO8YW+7679LAiXQg1M4uIYZM
	BVZ/Ex+EVBmLENq/3xJvRHsaZq1GyxllLMgQKNRuVNbhH6kXBFPj9pjKxrM8i9Cnm/c7Lk2tkF6
	cb/jeIoQIny2m/dsXXhy8glfv/hkE5NlEtEUSm+59B+ryQ/X/eKaEVVeGeBWHV7QdQLWt2QyNHW
	arZMb79djCx0u7gsTngbyZ2EuzKVQCjin6j4CFJfC+zeGQST+azS6uukqTFKBvT2VkcA6c9LvK7
	/G/q6TWPqkea5r/qPB7U71UBg1sNd1gDL1Kl0SGLEpTrZAnC3fuINgwD/hlvMZ61vCyHCDOmnt1
	LxFH1E+/rxGLMEwZXldekIIN1IrIDAj5A19LaVB995N6vfqYGGW/Rb5pem2nHrwihmqZnfAbphL
	CpdfvDAukMow1hoDCCyDx2YzkAtNGdKKtJKbFuhHJlUK8ESPbe13qvXWu81T0LYVto=
X-Received: by 2002:a05:701b:4306:20b0:184:1898:add2 with SMTP id a92af1059eb24-19935625958mr5098384c88.26.1792928805488;
        Sun, 25 Oct 2026 04:46:45 -0700 (PDT)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaebfsm15542281c88.15.2026.10.25.04.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 04:46:45 -0700 (PDT)
Date: Sun, 25 Oct 2026 19:46:40 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Roger Lu <roger.lu@mediatek.com>
Subject: =?US-ASCII?Q?Re=3A_soc=3A_mediatek=3A_SVS=3A_fix_device_re?=
 =?US-ASCII?Q?ference_leak_in_svs=5Fadd=5Fdevice=5Flink=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <230b2dd8-8d8f-4b1c-ac9f-2c1eac636751@web.de>
References: <20261023082948.1854252-1-coiaprant@gmail.com> <fa60e7c4-d8ca-4ff4-a56f-6a6e2bfbf3cf@web.de> <9AE974CC-F342-42F0-84A3-D72C3A0326C2@gmail.com> <230b2dd8-8d8f-4b1c-ac9f-2c1eac636751@web.de>
Message-ID: <2E8D967C-6CC3-44C9-B447-9D977E7A6538@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_044646_666287_FF29C956 
X-CRM114-Status: GOOD (  12.29  )
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

On October 25, 2026 7:42:51 PM GMT+08:00, Markus Elfring <Markus=2EElfring@=
web=2Ede> wrote:
>=E2=80=A6
>> __free(), DEFINE_FREE() and return_ptr() only appeared in v6=2E5, while
>> this driver dates back to v5=2E19 and the fix is tagged for stable (fir=
st
>> LTS is v6=2E1)=2E Converting to scope-based cleanup here would not comp=
ile
>> on 6=2E1=2Ey and would force the stable team to rewrite the backport=2E
>>=20
>> So I'd prefer to keep the explicit put_device() in this patch and leave
>> the __free(put_device) conversion to whoever owns the driver, as a
>> separate cleanup when the stable backport is no longer a concern=2E
>
>Would you eventually like to become more involved with corresponding
>source code transformations?
>
>Regards,
>Markus

Hi Markus,

Thanks, that's kind of you=2E I'll keep it in mind, but I can't promise
consistent bandwidth =E2=80=94 my kernel time comes in bursts=2E

PCS is where most of my remaining TODO list is, so that's where I'll
spend the next chunk of time=2E If I get through that and still have room,
I'll take a look at the other device_link_add() call sites that have the
same missing-put_device pattern=2E There seem to be a few=2E

Regards,
Coia

