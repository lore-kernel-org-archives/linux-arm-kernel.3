Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CA2C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51TUn5/ks90trMVZXFXIf1x3ahGoUywqkA/5qasa/rE=; b=TWCW9zlPjEaqzPjDiDWfSAiCjE
	25GotTRU536nI9u2GzI4WQ75G1Z8gCVk/acJmlbMdK4Oy6ItqH+wFRVSpoofgEAq+0eQcI8YksBLz
	Xy8O19UhrTjmELHoXQTDmCx3hFnPFgjoWA5FvmZo5EoX1Xf26yBfxLp0gDycJj/qphNxiUtpzTcqJ
	CLIliSWC62LZP5/aTy30rhBnHDOuvtKGxNyRHADpRmqrIMUsVhGZt/TxEjvD5pgsqWNLQcQBRbZcB
	J46fj/sOQxoJbAdBJCrsgr/zpuVFtNIfNLCZrCGwRaTdZde4qicnkSUV33Uzsc8IZPWPelgqn6SpH
	lKyuR0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td8yc-000000077LL-2WM6;
	Wed, 29 Jan 2025 14:23:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td8xI-0000000774M-1xwH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 14:22:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 161445C5CD4;
	Wed, 29 Jan 2025 14:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A63C4CED3;
	Wed, 29 Jan 2025 14:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738160530;
	bh=/uy2KVK+92bnjkNkIT1iw5CrTdiZ0e2lwuNq07xf8OM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=djFiyaI1DlJWiFHE8181GXXxjAr3wEqHuYYG3QsXELwZvDKxnRVxjUbFdIQbTnmLU
	 Lt9fufnc/G7WtGz9dtGAS3ZPyc4zzMF7RCfLnP+iBbDKwR+eb444lgkHrtJ/IVzKnP
	 WXttUr2Yxs6fWKBISWq0/x5ZYEIrKYg1CFR9lX/xH1tZyDicoyC+ae2lT5AysNsQ5+
	 Zrzl0ec3PcPgnqhqfetOvYwj+teyI/gwI8joVAbOMvx/WjRa3zWtMYKccoxnJSJUEq
	 elKqiXQFndQZbOtUJb0kgnqPfoQifhZUjqbQYA3D92ZpRy6VKsPv9SGhYwjgHdtLhq
	 gPYPXMPtSHgOQ==
Date: Wed, 29 Jan 2025 15:22:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-hardening@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 workflows@vger.kernel.org
Subject: Re: [RFC v2 00/38] Improve ABI documentation generation
Message-ID: <20250129152203.0dda53ca@foz.lan>
In-Reply-To: <20250129024518.69c0be81@foz.lan>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
	<87h65i7e87.fsf@trenco.lwn.net>
	<20250129024518.69c0be81@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_062212_613276_F7A8F0B8 
X-CRM114-Status: GOOD (  18.93  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Em Wed, 29 Jan 2025 02:45:18 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> > I've only tested with current Sphinx,
> > have you tried this with the more ancient versions we support?  
> 
> Not yet, but I double-checked at Sphinx documentation to be sure that
> I won't be using any newer methods: I just kept using the same Sphinx
> API as used by other extensions at the Kernel.

Just checked it with Python 3.6 and Sphinx 3.4 on Fedora 41 with:

	sudo dnf install python3.6.x86_64
	python3.6 -m venv Sphinx-3.4
	pip install alabaster Sphinx==3.4.3 pyyaml

There were some issues related to problems with early f-string
support, as reported by Akira.

After applying the enclosed patch, it is now working fine. The only
drawback is here:

	- print(f"Defined on file{'s'[:len(files) ^ 1]}:\t{", ".join(files)}")
	+ print("Defined on file(s):\t" + ", ".join(files))

As I removed the file/files auto-plural logic depending on the files
array length. Not a big deal.

I'll double-check if there's no other diff between old/new version
and add the enclosed patch in the end.

Thanks,
Mauro

[PATCH] scripts/get_abi.py: make it backward-compatible with Python 3.6

Despite being introduced on Python 3.6, the original implementation
was too limited: it doesn't accept anything but the argument.

Even on python 3.10.12, support was still limited, as more complex
operations cause SyntaxError:

	Exception occurred:
	  File ".../linux/Documentation/sphinx/kernel_abi.py", line 48, in <module>
	    from get_abi import AbiParser
	  File ".../linux/scripts/get_abi.py", line 525
	    msg += f"{part}\n{"-" * len(part)}\n\n"
                       ^
	SyntaxError: f-string: expecting '}'

Replace f-strings by normal string concatenation when it doesn't
work on Python 3.6.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 543bed397c8c..e6e94f721fff 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -522,7 +522,7 @@ class AbiParser:
 
                 if cur_part and cur_part != part:
                     part = cur_part
-                    msg += f"{part}\n{"-" * len(part)}\n\n"
+                    msg += part + "\n"+ "-" * len(part) +"\n\n"
 
                 msg += f".. _{key}:\n\n"
 
@@ -546,7 +546,7 @@ class AbiParser:
                     msg += f"Defined on file :ref:`{base} <{ref[1]}>`\n\n"
 
             if wtype == "File":
-                msg += f"{names[0]}\n{"-" * len(names[0])}\n\n"
+                msg += names[0] +"\n" + "-" * len(names[0]) +"\n\n"
 
             desc = v.get("description")
             if not desc and wtype != "File":
@@ -570,7 +570,8 @@ class AbiParser:
 
             users = v.get("users")
             if users and users.strip(" \t\n"):
-                msg += f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n\n"
+                users = users.strip("\n").replace('\n', '\n\t')
+                msg += f"Users:\n\t{users}\n\n"
 
             ln = v.get("line_no", 1)
 
@@ -596,7 +597,9 @@ class AbiParser:
                 elif len(lines) == 1:
                     f.append(f"{fname}:{lines[0]}")
                 else:
-                    f.append(f"{fname} lines {", ".join(str(x) for x in lines)}")
+                    m = fname + "lines "
+                    m += ", ".join(str(x) for x in lines)
+                    f.append(m)
 
             self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
 
@@ -644,10 +647,11 @@ class AbiParser:
                     if users:
                         print(f"Users:\t\t\t{users}")
 
-                    print(f"Defined on file{'s'[:len(files) ^ 1]}:\t{", ".join(files)}")
+                    print("Defined on file(s):\t" + ", ".join(files))
 
                     if desc:
-                        print(f"\n{desc.strip("\n")}\n")
+                        desc = desc.strip("\n")
+                        print(f"\n{desc}\n")
 
         if not found_keys:
             print(f"Regular expression /{expr}/ not found.")

