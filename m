Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17438606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 17:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bWL11VIw;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wfqs9PNd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=; b=bWL11VIw/ngB5ofoAc5rnEOPVt
	L8Wz1BqhHbxd0CNJjSuvy6Vma7WvFog8ihLySi+r2VotORm2Z21Mp0sIR9K9z6SMJnKCWrAGK8sZy
	WbdV71LqgiSRMIGFFIBupWdK5HiSonSbIo69rUo7Zt6IlmZU2PK/HiiTtFLNIEmU7uRqdOabfwppp
	zP9/np9JIgg28eSAcGw8G2RtBvZmc+uwaA41sKgrQ0u9uf2y5IFrs5gEcWG4oN5nkD/b4q1js4AUk
	Yg0KiXFO1WI+4cu3DdJGYmXqmTMvQnLYfDafmMGL9lXl5MFiKx9Os94YdnKANhg91edR1GiQW+mo4
	jKOPtuzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLksF-00000005SES-0kZt;
	Tue, 27 Oct 2026 17:22:11 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLksD-00000005SDG-10tQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 17:22:10 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-157fe9d771bso60518c88.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Oct 2026 10:22:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793121727; cv=none;
        d=google.com; s=arc-20260327;
        b=GTskOffcIdb1DcrfzE7D4mTJ9qCUAHYjQ8aGB5laA8tV/X6lfDvU/fpy34MJTB4Vev
         vYCQ5ngHsT1QudG7pNoXOWmWsMPLE1SE5T5eZ994ytjDMkFO4E3Gi275SRHzYgvj0Qh7
         GOcmrz/wEh8EoIT9afNiwL6gmPsheBXV80gCZ6dM6L+tOCSDV7Lx+zZrx7gLBSoFGqga
         skK934bKJQ8NWOLytZmsJiKfQXwE73a/wjx7iomRUU2D9rFi6e64rxF+NbX2+QMeSOXy
         Hy7n6q2z8ZGMRV9e9BSu0LsU1XHLI6YnfzBYR9PexrSXzrL8MpxjuMv5HfNWXgYOJkCk
         ciNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        fh=bsLJ93idmcKvkIt5PSGs03B9q0oSp724UL9HVn1JiSk=;
        b=Q4upY0iiQwhgcRAcSMJF7VG1oLZK/C8Ksodb8E2ryUqzjgmUWsLHWtRYB9pSEH2Z05
         re0DU6t2bGI8/uf3qHgSMYMkGGnoU56ju3wXyec0jqISiTI+RPnzWIa/TBBqIIx2zAww
         3Drn52neaoFkgzoE7JdCNvAN+2+0ApjT7wSsKH/c1bqJjZWQWZTakYBf5elzDWzU3t6e
         o6rQoUVwNgjeFAgODMfUu5p170RaQH5JwkMsUzj24xO8oXnJtoRBi4qESZkW+BLR9nR9
         p+5nehfcO7h5mhWugEHWU87/GSNN+gGssY16h3yDcjXciWw1BfwWe3TXTCpLwu/UqUld
         YPpQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793121727; x=1793726527; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        b=Wfqs9PNdjEoBwO8NNfSA/G7pyLZFZxA3cCs2RCadE3+B9lT6PZ6/XM1YxlN3K1qViC
         LfiIOnzORETCP2uGOW2nJFcNwNewHuBgGNmcLAb+vkzP5/BOY+ko/ZipIUbgAsD8mUhO
         UMgC2Htb0pSyaCU/h5b9yUdzkxDOBRSjbMHCdiVsEj5fqdqtvkVs+ZI8fIcjIPCD1x8B
         rZtuVxS8TjVpb/lLLFxfnJ1QT7vQaGYIwn2QVhJHCtrJGN5q1UBBi72p/P920/fyMZVa
         CGz9JRz3jC5WaRtXebBm0taqe7PgTB/z8RCzdWk6eXpPGg2cmKpb91QupvXDzDyKzy7s
         VwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793121727; x=1793726527;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sCMHExecnr7EVku3xKOnADgdNnCumi8ICt8RRfPLFyc=;
        b=BofDf8LS/L2QfupvpC6ks5EaCspfzKaOGQJNshhXjvxxqZr3jp0HawtP4N8yNlLeHc
         qWG7lGK3scpcqHCF0mBrpgbWBnTCRWkPPBjhWbDergHNMQPDMqvo42DAaV7MORy/TLbt
         wIUZcx3iy8wNfflCMmvy690jMNUufcuPhTL0mVwOMGilg4nxB6sjn1mNiAkJpj2hfh7u
         HQiCKOWFptMJvvopM65pPLXH7hJYthCmUQqmnOf35LmBuI7f76NbIsJtEHLUqaBhBOVt
         9fTvL89c+Y4MRi+DMAXSDny/yRbNbB+07SYYXjcycfv8meV8U9ykO3pdaVJ45cRwFAcb
         m5Fw==
X-Forwarded-Encrypted: i=1; AKwUvBwl9CZEXd49sZvrluhR9rOVeTVgvfTHCTcB+q0eGimmBwPgqYWlUiduxrcDP4QzGiDMQzlX1LtaDOBbSLu4tLbv@lists.infradead.org
X-Gm-Message-State: AFq9FYKg3ZboIGZguyKGpPLMN/gqzNhx2OvVhx2pgDN65rXa2ZSO3eXt
	sTNY0FFykSbnK3RcfyJFR8NbEco1xlX+hCqrhi6Bt4CJdfZ+48LZxYrnw9mq3Pqgl6+dNT51q1R
	rJuQVSUh1LCVVwrelVbh2r2f0cDmI7ZwhTya0qpZD
X-Gm-Gg: AYBFou2sZ9IV9uKanmIuo/K2vvXIxt2GR9z7q9JFMysnFSVSGFQ3shr8OfSmYFObveg
	j8+UNE639LqJrxkt9h2gZ09rm59QbJXcfwJX96G6Pg/zXrDBzd45YcLqoCtWtUWIDzYUIv9pIyX
	snw6Vmbo8Le9TrdMFHjxZTvrBIR/K4/GWz0L+9iOCfVwyul2XJAH5+TIaCAppqnm0P5Drb6f99H
	eFqiCTMDIEcSpwymY65QuSLIvgC5X9sQaKzYjMG8h+iGftqUNW7GaebwdQlsvZTULBU3LlVhvs3
	j+XZvSZ96D1aJ9B9gIvBGJpom/XOQNA+dsFgvyxovvKEng8ObJskw1aLlEWnQvlKi/TGBX2f1gp
	J5rt+r7XDyOl9seSrEZP+V/gAI0z3Zmwxm6iBSax4IBYEDb+9eKVpraD2UeBb5IaiqKZ4X0aupr
	rZqfQLuzmK/zk=
X-Received: by 2002:a05:701b:2311:b0:16a:8ffd:4977 with SMTP id
 a92af1059eb24-199363a356emr13049111c88.17.1793121726447; Tue, 27 Oct 2026
 10:22:06 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
 <20261027124954.110697-10-zoone.rupert@gmail.com> <auDNzWMPy0VQcazt@ashevche-desk.local>
In-Reply-To: <auDNzWMPy0VQcazt@ashevche-desk.local>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Oct 2026 18:21:29 +0100
X-Gm-Features: AclHuK8orvmEUb-f7W0Au_t0jJZW6yeRJKoPRMRQ-D7ejg8oB9UAKvhykKBG7IM
Message-ID: <CANpmjNNNw3Ont87-Uqo_j4YrPbamHLue=EAMkc+B66Q_yywQ9A@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Rupesh Majhi <zoone.rupert@gmail.com>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Benson Leung <bleung@chromium.org>, 
	David Lechner <dlechner@baylibre.com>, Guenter Roeck <groeck@chromium.org>, 
	Jagath Jog J <jagathjog1996@gmail.com>, Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jinseob Kim <kimjinseob88@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Remi Buisson <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_102209_274826_DC3A3A5F 
X-CRM114-Status: GOOD (  13.11  )
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
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 at 17:14, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Oct 27, 2026 at 02:49:54PM +0200, Rupesh Majhi wrote:
> > All of drivers/iio now builds without context analysis warnings, so
> > enable it in every Makefile that builds objects, replacing the entry
> > for dps310 alone.
>
> ...
>
> > +++ b/drivers/iio/Makefile
>
> > +CONTEXT_ANALYSIS := y
>
> Can we reduce the churn to only adding it here and do some magic to propagate
> this recursively, please? I truly believe it's feasible to achieve.

Should be:

subdir-ccflags-y += $(CFLAGS_CONTEXT_ANALYSIS)

