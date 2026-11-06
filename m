Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2CF606D833
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cQWgCSDp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hoq7ysBs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=; b=cQWgCSDpM0t415
	A4AfgJSOuExF/Ei/tX8Gzq+t4dgQWYHjARhimfawIvbjRrz0jYaJ1CTXzBRUSh+6tqWfL5SqqFCHD
	6rZLzSZ1pIdyE4dw3GSilcBdoqAiZdC5PK3urxvaiiDb5AC2cQnc6VJc1wCgg7M005cmeDMbZI9N0
	d+pQgT8WcMwr38Gf8z6+3Z6L8YBySwHjEUms7p7uPjPvOluGewmG3QBJJOr3bIGU/VYrmokdtd2tw
	UYrbd1Zg9oEev3FkFOTR8ydHBrtbNpx7KtnNGPSXuVR92tUCw6Q7aKSkUNyaoxw5wgA+J39j0r3Np
	z4V077D/5Ju8gMWC3zIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIDZ-0000000CADI-1PTD;
	Fri, 06 Nov 2026 11:34:49 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIDW-0000000CAC2-2sq8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:34:48 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-67583c777abso618177d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 03:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964885; x=1794569685; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
        b=Hoq7ysBsj7j9uRewrqGWspIbyTZ3MS9sUWYG3G8buYgjF5ep/GlOuXp1VLfxEFRgcO
         uOTaKv5nLtzjVQ8pJD8GVNMlqjONqVQtydVbCqgVNRGZRDDwh2awk4DUiTH8muaj1xgB
         niUBYQoIqvXralC8uWB64P4G3EcGHueIKd0BkbGjuA33K5BfUwgKp+fIA2Hv1oQPGmUv
         QZTRCrgtT2SGIvuXZ/R1ILV81n8oJMW138pZPoWljIeHbHW1R4KX6z2ImNBrmDrU+RIv
         opkCMr3x12a7Q89QiATH7iuc0V4HmdrAfCcmZbBi7VO6UmvOXQB5pD9UHXCph7ewOsMu
         TVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964885; x=1794569685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
        b=JO2VYvlta68w7EZly5mmwOH17WZ8YWIq0AaVZ4A2AriC3tw9rl1rmm39u3jaaBisdk
         o1Os8zQIR7egRtNWZ7tArqIL97d5XCCk4z9BplqPzjCCGQ/I3u2btVlRUqqZI/5/Ip3U
         idY2OtrOrgvq8sV5hE3eLvQlSDI7d/wrKTk+UdJMtdTgY5rVxid+ozwM0geTIPUeXBdc
         2zUVOnrqpseLZV4uqRK5T/x/2pzKLTXX/3qEkvI30WJwPw0JsMYwb/4qdtx97iDTCHjW
         l3PryuRL8Z8IPjm4DCjADXRLpp2GraohNGPqH3oXU3bhE1YxIu9Z2/JHYL3ud91TSkZ+
         Ij4A==
X-Forwarded-Encrypted: i=1; AL+hErEkRLmmEhfi/K3vfuuFv3ySsf2gEs3Dcb0izJkUBU4SlbegBkkmvW7vRdxUiWU/qUrsBeocpmMc5jDr15U2mUHS@lists.infradead.org
X-Gm-Message-State: APuU4Z9iws5rn1Kzi4ObhTPOBftFHw9DTuZ8R5ZLLCb3xA4g7f0myTtq
	jA5YvFmfhgaH2NQ5wmiVWNVDxAooV42B32SXrU8cf+a5bzxFq/JVpePG
X-Gm-Gg: AYBFou2oDThEYkIrhldVJnad8I7u4StG8pY1YumgBaqtYR1Ht2YUWzpT+Os//rDrG1g
	O1QU+ocAuBa6tMLJp8ySGyGK9rbJb5R7967TJglTIWax8pJZU5N0lpU/CYfM1T6V7zoGcKWKSFz
	jdler89aaMMP1oqXvcv/iYhIIysYHQEkYl4rPI78JxLj6QHA44DSRFFVuREWRiXE9VH+3YW+WAr
	Fyl3rZAQvn4aLOdCPWhgot842GJU+AJXbJtztoB5XN5cPhKJWa9O4S92bsD2pkhKMt0LXQ/+iwD
	R/T5/+d2NiA4qTRdfRDZXKpgaXO0koL2/IsPN+Vb60UMB6n0+eENE7XhtfazxYQ2H/D/NySMsqk
	b7+VmmxaNSvLE0iMbK6CZWtx4KYGhbmT3rvDbYZ5oET0IdrLsWTJ3Dam4MtUL9e056EzVoQMdGa
	VGdB9kOh6/AV8CMmsHn/hgfDEm7dhZdFb5RAdEsngQyl3sXAmIalzaWNTAt+L23q9e6t0V2UC0x
	m9yix5fCtAc5pkhTQ1kjWa5Fpeg6IwQnx1tvop3DiFAHNYSzt78yYUFzgre5+Xi5TwQMr5qkQhW
	TacBoLb/joO2hxeBSHtgOC8jX/ErPalrorIAxVYcBcnsmyPV+e37ulc7hKuxRjPkxL1PE2PqTnA
	W8Wi6Vs87Ootgm2leyzitTcw5Y4vE7trS74XtRL+fIRnO4Gbdvx89OlUBoA==
X-Received: by 2002:a53:490e:0:b0:67b:f09e:da89 with SMTP id 956f58d0204a3-67c14249884mr916080d50.10.1793964884851;
        Fri, 06 Nov 2026 03:34:44 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c13540451sm1708137d50.10.2026.11.06.03.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:34:44 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: sunxi: A733: use the two-bit I/O voltage fields
Date: Fri,  6 Nov 2026 08:34:24 -0300
Message-ID: <20261106113425.28936-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_033446_731662_FF535B55 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/12/26 15:41, Vinicius Pedrosa wrote:
> this follows my question in [1]. Andre asked why not extend the A733 I/O
> bias code to two bits instead of switching it off, so patch 1 does that
> [...]

Please disregard this series, Enzo's v2 supersedes it:
https://lore.kernel.org/all/20261104-a733-pinctrl-v2@gmail.com/

Thanks,
Vinicius

